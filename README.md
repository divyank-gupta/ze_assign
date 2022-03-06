# ze_assign
Tested on MacOS machine
Terraform Version 1.16.0

Pre-requisites

a) Install Terraform and AWS CLI

b) Create an account on AWS

c) Setup AWS Profile



There are 3 modules:

Networking - It helps to set up the networking part (vpc, subnets, igw, nat, routing tables and association)

EC2 - It helps to create bastion machines and working nodes

Security And Authentication - It helps to create Key Pair, used to ssh to the bastion machine and ssh from bastion machine to worker machine. Also creates the security groups. 


Take a clone of this repository, and run the following commands to initialize the infrastructure:

1. terraform init

2. terraform plan -var-file dev.tfvars

3. terraform apply -var-file dev.tfvars

After provisioning the infrastructure, you will have a key created in your current working directory.
You can use tha key to login to the machines.
