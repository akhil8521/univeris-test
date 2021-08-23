#VPC

variable "network_name" {
  description = "The name of the network being created"
  default     = "main"
}

# SUBNET

variable "public_name" {
  description = "The name of the public network where subnets will be created"
  default     = "public"
}

variable "private_name" {
  description = "The name of the private network where subnets will be created"
  default     = "private-nat"
}

variable "protected_name" {
  description = "The name of the protected network where subnets will be created"
  default     = "protected"
}
#google_compute_subnetwork.private_nat

variable "private_nat" {
  description = "The name of the private network where subnets will be created"
  default     = "test"
}


variable "public_subnet_cidr" {
  description = "The cidr block of public_subnet"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "The cidr block of private_subnet"
  default     = "10.1.0.0/24"
}

variable "protected_subnet_cidr" {
  description = "The cidr block of protected_subnet"
  default     = "10.2.0.0/24"
}

variable "custom_count" {
  default     = ""
  description = "The count of subnetwork will be created if null no of subnets will be equal to no of Az's available."
}

# Nat-Gateway

variable "router_name" {
  description = "The name of the router where subnets will be created"
  default     = "router"
}

variable "nat_name" {
  description = "The name of the router where subnets will be created"
  default     = "main"
}


variable "region" {
  description = "The name of the network being created"
  default     = "us-west2"
}