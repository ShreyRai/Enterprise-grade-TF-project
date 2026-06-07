cidr_vpc = "10.0.0.0/16"
vpc_name = "prod_vpc"
cidr_public = "10.0.7.0/24"
cidr_private = "10.0.8.0/24"
public_subnet_name = "Public_sub03"
private_subnet_name = "Private_sub03"
igw_name = "igw_03"
route_table_name = "RT-03"
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
#=================Instance Vars================
#ami_id = "ami-00e801948462f718a"
instance_type = "t3.medium"
instance_name = "prod-01"
instance_names = ["web-prod-01", "web-prod-02", "web-prod-03"]
