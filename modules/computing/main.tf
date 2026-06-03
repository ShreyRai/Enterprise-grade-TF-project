locals {
    subnet_id = var.is_bastion ? var.public_subnet_id : var.private_subnet_id
}

resource "aws_instance" "ec2-01" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_id
    subnet_id = local.subnet_id
    tags = {
      "Name" = var.instance_name
    }
}