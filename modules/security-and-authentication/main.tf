resource "tls_private_key" "dev_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.generated_key_name
  public_key = tls_private_key.dev_key.public_key_openssh

  provisioner "local-exec" {    # Generate "terraform-key-pair.pem" in current directory
    command = <<-EOT
      echo '${tls_private_key.dev_key.private_key_pem}' > ./'${var.generated_key_name}'.pem
      chmod 400 ./'${var.generated_key_name}'.pem
    EOT
  }

}

resource "aws_security_group" "sg1_bastion-machine" {
  count                     = var.instance_count
  name = "${var.environment}-bastion-sg"
  vpc_id = var.vpc_id
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "-1"
    from_port = 0
    to_port = 0
  }  
  ingress {
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    to_port = 22
  }
}

resource "aws_security_group" "sg2_private_machine" {
  count                     = var.instance_count
  name                      = "${var.environment}-private-sg"
  vpc_id                    = var.vpc_id
  egress {
    # { for i in var.bastion_public_ip:
    #   cidr_blocks.append(i"/32")
    # }
    cidr_blocks             = ["0.0.0.0/0"]
    protocol                = "-1"
    from_port               = 0
    to_port                 = 0
  }  
  ingress {
    # { for i in var.bastion_public_ip:
    #   cidr_blocks.append(i"/32")
    # }
    protocol                = "tcp"
    cidr_blocks             = [ "0.0.0.0/0" ]
    from_port               = 0
    to_port                 = 22
  }
}
  