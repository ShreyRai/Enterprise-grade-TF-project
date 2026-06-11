cidr_vpc = "10.0.0.0/16"
vpc_name = "Dev_vpc"
cidr_public = "10.0.1.0/24"
cidr_private = "10.0.2.0/24"
public_subnet_name = "Public_sub01"
private_subnet_name = "Private_sub01"
igw_name = "igw_01"
route_table_name = "RT-01"
#=================Security Vars================
ingress_values = [{
    port = 22
    description = "ssh"
},
{
    port = 80
    description = "http"
},
{
    port = 443
    description = "https"
}]
#=================Instance Vars===================
#ami_id = "ami-00e801948462f718a"
instance_type = "t2.micro"
instance_name = "dev-01"
instance_names = ["web-dev-01", "web-dev-02", "web-dev-03"]
path = "/mnt/d/proj/Terraform/Enterprise-grade-TF-project/modules/computing/bootstrap.sh"
