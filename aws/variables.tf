variable "vnet_cidr_block" {
  type = string
  description = "The IPv4 CIDR block for the VPC."
}

variable "vpc_tags" {
  type = map(string)
  default = {}
  description = "(Optional) A map of tags to assign to the resource."
}

variable "public_subnet_cidr" {
  type = string
  description = "(Optional) The IPv4 CIDR block for the public subnet."
}

variable "private_subnet_cidr" {
  type = string
  description = "(Optional) The IPv4 CIDR block for the private subnet."
}

variable "public_subnet_tags" {
  type = map(string)
  default = {}
  description = "(Optional) A map of tags to assign to the resource."
}

variable "private_subnet_tags" {
  type = map(string)
  default = {}
  description = "(Optional) A map of tags to assign to the resource."
}