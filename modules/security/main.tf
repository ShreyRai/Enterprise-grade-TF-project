resource "aws_security_group" "sg-01" {
    vpc_id = var.vpc_id
    dynamic "ingress" {
        for_each = var.ingress_values
        content {
          description = each.value.description
          to_port = each.value.port
          from_port = each.value.port
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }

    }
    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

  
}