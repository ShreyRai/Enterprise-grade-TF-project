terraform {
  backend "s3" {
    bucket       = "tf-state-bucket-enterprise-grade"
    key          = "statefiles/dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

data "aws_ami" "azlinux23" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "network" {
  source              = "../../modules/networking"
  cidr_vpc            = var.cidr_vpc
  vpc_name            = var.vpc_name
  cidr_public         = var.cidr_public
  cidr_private        = var.cidr_private
  public_subnet_name  = var.public_subnet_name
  private_subnet_name = var.private_subnet_name
  igw_name            = var.igw_name
  route_table_name    = var.route_table_name
  enable_NAT          = false
}

module "security" {
  source         = "../../modules/security"
  ingress_values = var.ingress_values
  vpc_id         = module.network.vpc_id

}
module "dev" {
  source                = "../../modules/computing"
  for_each              = toset(var.instance_names)
  ami_id                = data.aws_ami.azlinux23.id
  instance_type         = var.instance_type
  security_group_id     = module.security.security_group_id
  is_bastion            = true
  instance_name         = each.value
  public_subnet_id      = module.network.public_subnet_id
  private_subnet_id     = module.network.private_subnet_id
  ec2_ssm_role          = "${each.value}-ssm-role"
  instance_profile_name = "${each.value}-ssm-instance-profile"
  #user_data             = file("${path.module}/bootstrap.sh")
}