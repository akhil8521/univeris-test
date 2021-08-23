variable "public_name" {
  description = "The name of the public network where subnets will be created"
}

variable "private_name" {
  description = "The name of the private network where subnets will be created"
}

variable "protected_name" {
  description = "The name of the protected network where subnets will be created"
}

variable "public_subnet_cidr" {
  description = "The cidr block of public_subnet"
}

variable "private_subnet_cidr" {
  description = "The cidr block of private_subnet"
}

variable "protected_subnet_cidr" {
  description = "The cidr block of protected_subnet"
}

variable "custom_count" {
  default     = ""
  description = "The count of subnetwork will be created if null no of subnets will be equal to no of Az's available."
}

variable "network_name" {
  description = "The name of the network being created"
}


variable "region" {
  description = "The name of the network being created"
}

### NAT 

variable "router_name" {
  description = "The name of the router where subnets will be created"
}

variable "nat_name" {
  description = "The name of the router where subnets will be created"
}


###
