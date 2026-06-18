variable "vpc_id" {}
variable "ingress_values" {
    type = list(object({
      port = number
      description = string
      protocol = string
    }))
}