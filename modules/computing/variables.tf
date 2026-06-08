variable "is_bastion" {
    type = bool
}
variable "ami_id" {}
variable "instance_type" {}
variable "security_group_id" {}
variable "public_subnet_id" {}
variable "private_subnet_id" {}
variable "instance_name" {}
variable "user_data" {}