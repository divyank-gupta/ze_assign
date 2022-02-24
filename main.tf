provider "aws" {
  region = var.region
}

locals {
  production_availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
}

module "networking" {
    source = "./modules/networking"
    region               = var.region
    environment          = var.environment
    vpc_cidr             = var.vpc_cidr
    public_subnets_cidr  = var.public_subnets_cidr
    private_subnets_cidr = var.private_subnets_cidr
    availability_zones   = local.production_availability_zones
}


module "security-and-authentication" {
  source                 = "./modules/security-and-authentication"
  environment            = var.environment
  generated_key_name     = var.generated_key_name
  vpc_id                 = module.networking.vpc_id
  bastion_public_ip             = module.ec2.bastion_public_ip
  instance_count         = var.instance_count
}


module "ec2" {
  source                 = "./modules/ec2"
  instance_count         = var.instance_count
  instance_ami           = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.networking.vpc_security_group]
  private_security_group_ids = [module.networking.vpc_security_group, module.security-and-authentication.private-sg]
  private_subnet_id      = module.networking.private_subnet_id
  public_subnet_id       = module.networking.public_subnet_id
  key_name               = module.security-and-authentication.ssh_key
}