variable "image_id" {}
variable "instance_type" {}
variable "security_group_ids" {}
variable "user_data" {
    default = null
}
variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}
variable "asg_name" {}
variable "subnet_ids" {}
variable "asq_tag_name" {}
variable "aws_launch_template_name" {}