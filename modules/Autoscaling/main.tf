resource "aws_launch_template" "alt-01" {
  name_prefix = var.aws_launch_template_name
  image_id = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  user_data = var.user_data
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "asg-01" {
    name_prefix = var.asg_name
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    vpc_zone_identifier = var.subnet_ids

    launch_template {
        id = aws_launch_template.alt-01.id
        version = aws_launch_template.alt-01.latest_version
    }
    health_check_type = "EC2"
    health_check_grace_period = 300
    lifecycle {
        create_before_destroy = true
        ignore_changes = [desired_capacity]
    }
    tag {
        key = "Name"
        value = var.asq_tag_name
        propagate_at_launch = true

    }
}