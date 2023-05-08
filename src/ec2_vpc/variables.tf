variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR range."
  default     = "10.169.0.0/27"
}

variable "subnet_cidr" {
  type        = string
  description = "Subnet CIDR range."
  default     = "10.169.0.0/27"
}

variable "subnet_az" {
  type        = string
  description = "Subnet Availability Zone."
  default     = "us-east-1a"
}
