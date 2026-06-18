variable "vpc_name" {}
variable "cidr_vpc" {}
variable "public_subnet_name" {}
variable "private_subnet_name" {}
variable "cidr_public" {}
variable "cidr_private" {}
variable "igw_name" {}
variable "route_table_name" {}

#==============================NAT Gateway and EIP Variables - Default null=========================================
variable "count_prod_pub_sub" {
    default = 0
}
variable "prod_private_subnet_name" {
    default = null
}
variable "nat_gateway_name" {
    default = null
}
variable "nat_eip_name" {
    default = null
}
variable "route_table_name_2" {
    default = null
}
variable "cidr_prod_private" {
    default = null
}
#=====================================Conditional Vars============================
variable "enable_NAT" {
    description = "This will enable NAT Gateway and EIP creation if set to true"
    default = false
}