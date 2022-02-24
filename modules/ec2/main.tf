resource "aws_instance" "ec2" {
  count                     = var.private_instance_count
  ami                       = var.instance_ami
  instance_type             = var.instance_type
  subnet_id                 = element(distinct(compact(concat(var.private_subnet_id))), count.index)
  vpc_security_group_ids    = var.private_security_group_ids
  key_name                  = var.key_name
}

resource "aws_instance" "ec2_bastion" {
  count                     = var.public_instance_count
  ami                       = var.instance_ami
  instance_type             = var.instance_type
  subnet_id                 = element(distinct(compact(concat(var.public_subnet_id))), count.index)
  vpc_security_group_ids    = var.public_security_group_ids
  key_name                  = var.key_name
}