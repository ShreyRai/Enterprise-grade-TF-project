variable "is_bastion" {
    type = bool
    #default = true
}
variable "ami_id" {}
variable "instance_type" {}
variable "security_group_id" {}
variable "public_subnet_id" {}
variable "private_subnet_id" {}