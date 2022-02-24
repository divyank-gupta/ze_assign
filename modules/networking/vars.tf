# variable "common_tags" {
#   description = "Common tags to apply to all resources"
#   type        = map(any)
# }

# # variable "project" {
# #   description = "The name of the project"
# # }

# # variable "env" {
# #   description = "The name of the environment"
# # }

# variable "cidr_block" {
#   description = "CIDR of VPC"
# }

# variable "vpc_name" {
#   description = "VPC name"
# }
variable "region" {
  description = "AWS region"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
}

variable "environment" {
  description = "Environment Name"
}

variable "public_subnets_cidr" {
  description = "Public Subnets CIDR's"
}

variable "private_subnets_cidr" {
  description = "Private Subnets CIDR's"
}


variable "availability_zones" {
  description = "Availability Zones"
}
