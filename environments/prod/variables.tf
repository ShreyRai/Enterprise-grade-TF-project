variable "cidr_vpc" {}
variable "vpc_name" {}
variable "cidr_public" {}
variable "cidr_private" {}
variable "public_subnet_name" {}
variable "private_subnet_name" {}
variable "igw_name" {}
variable "route_table_name" {}
variable "count_prod_pub_sub" {}
variable "prod_private_subnet_name" {}
#=================Security Vars================
variable "ingress_values" {}
#=================Instance Vars================
#variable "ami_id" {}
variable "instance_type" {}
variable "instance_name" {}
variable "instance_names" {}
variable "path" {}
#====================ASG vars====================
variable "aws_launch_template_name" {}
variable "asg_name" {}
variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}
#variable "subnet_ids" {}
variable "asq_tag_name" {}
#variable "security_group_id" {}
variable "nat_gateway_name" {}
variable "nat_eip_name" {}
variable "route_table_name_2" {}
variable "cidr_prod_private" {}
