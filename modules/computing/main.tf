locals {
    subnet_id = var.is_bastion ? var.public_subnet_id : var.private_subnet_id
}

# Create the IAM Role for EC2
resource "aws_iam_role" "ssm_role" {
  name = var.ec2_ssm_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

# Attach the required policy
resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Create the instance profile to attach to the EC2 resource
resource "aws_iam_instance_profile" "ssm_profile" {
  name = var.instance_profile_name #"ec2-ssm-instance-profile"
  role = aws_iam_role.ssm_role.name
}

resource "aws_instance" "ec2-01" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [var.security_group_id]
    subnet_id = local.subnet_id
    associate_public_ip_address = var.is_bastion ? true : false
    user_data = var.user_data != null ? var.user_data : file("${path.module}/bootstrap.sh")
    iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
    tags = {
      "Name" = var.instance_name
    }
}