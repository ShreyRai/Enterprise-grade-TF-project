resource "aws_vpc" "vpc-01" {
  cidr_block = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support = true
  # enableDnsHostnames = true
  # enableDnsSupport = true
  tags = {
    "Name" = var.vpc_name
  }
}