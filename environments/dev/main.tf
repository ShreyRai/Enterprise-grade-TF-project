module "network" {
    source = "../../modules/networking"
    cidr_vpc = var.cidr_vpc
    vpc_name = var.vpc_name
    cidr_public = var.cidr_public
    cidr_private = var.cidr_private
    public_subnet_name = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    igw_name = var.igw_name
    route_table_name = var.route_table_name
}

module "security" {
    source = "../../modules/security"
    ingress_values = var.ingress_values
    vpc_id = module.network.vpc_id.id
  
}
module "dev" {
    source = "../../modules/computing"
    ami_id = var.ami_id
    instance_type = var.instance_type
    security_group_id = module.security.security_group_id.id
    is_bastion = true
    instance_name = var.instance_name
    public_subnet_id = module.network.public_subnet_id.id
    private_subnet_id = module.network.private_subnet_id.id
}