# #Network Parameters
# region = "ap-south-1"

# #Tags
# project = "assignment"
# env     = "dev"

# #VPC
# cidr_block  = "172.16.0.0/16"
# vpc_name    = "zeta_vpc"


//AWS 
region      = "ap-south-1"
environment = "zeta"

/* module networking */
vpc_cidr             = "172.16.0.0/16"
public_subnets_cidr  = ["172.16.136.0/22","172.16.140.0/22"] //List of Public subnet cidr range
private_subnets_cidr = ["172.16.120.0/22","172.16.124.0/22"] //List of private subnet cidr range

/* module ec2 */
private_instance_count   = 1
public_instance_count    = 1
instance_ami             = "ami-0c6615d1e95c98aca"
instance_type            = "t2.micro"
generated_key_name       = "terraform-key-pair"