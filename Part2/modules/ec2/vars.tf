variable "private_instance_count" {
  description = "The number of ec2 instances to be launched in private subnet"
}

variable "public_instance_count" {
  description = "The number of ec2 instances to be launched in public subnet"
}

variable "instance_ami" {
  description = "AMI"
}

variable "instance_type" {
  description = "Type of machine"
}
variable "private_subnet_id" {
  description = "Private Subnet id"
}

variable "public_subnet_id" {
  description = "Public Subnet id"
}

variable "key_name" {
  description = "Key"
}

variable "private_security_group_ids" {
  description = "Security group"
}

variable "public_security_group_ids" {
  description = "Security group"
}