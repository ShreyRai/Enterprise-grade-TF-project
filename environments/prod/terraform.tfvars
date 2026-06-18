cidr_vpc = "10.0.0.0/16"
vpc_name = "prod_vpc"
cidr_public = "10.0.11.0/24"
cidr_private = "10.0.12.0/24"
cidr_prod_private = "10.0.13.0/24"
public_subnet_name = "Public_sub03"
private_subnet_name = "Private_sub03"
igw_name = "igw_03"
route_table_name = "RT-03"
route_table_name_2 = "RT-02"
nat_gateway_name = "nat-03"
nat_eip_name = "eip-03"
#=================Security Vars================
ingress_values = [{
    port = 22
    description = "ssh"
    protocol = "tcp"
},
{
    port = 80
    description = "http"
    protocol = "tcp"
},
{
    port = 443
    description = "https"
    protocol = "tcp"
},
{
    port = -1
    description = "ping"
    protocol = "icmp"
}]
#=================Instance Vars================
#ami_id = "ami-00e801948462f718a"
instance_type = "t2.medium"
instance_name = "prod-01"
instance_names = ["web-prod", "web-prod-bak"]
path = "Enterprise-grade-TF-project/modules/computing/bootstrap.sh"

#====================ASG vars====================
aws_launch_template_name = "prod-launch-template"
asg_name = "prod-asg-"
min_size = 1
max_size = 5
desired_capacity = 2
asq_tag_name = "prod-srv"
count_prod_pub_sub = 3
prod_private_subnet_name = "Prod-private-subnet"
