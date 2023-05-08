variable "vpc_id" {
  type        = string
  description = "VPC ID to attach the Security Group."
}

variable "sg_description" {
  type        = string
  description = "Description for the Security Group."
}

variable "for_sg" {
  type        = bool
  default     = false
  description = "Whether to control access by Security Groups. This MUST be false if for_ip is true."
}

variable "for_ip" {
  type        = bool
  default     = true
  description = "Whether to control access by IP adresses. This MUST be false if for_sg is true."
}

variable "ingress_source_sg_id" {
  type        = string
  default     = "NONE"
  description = "The Security Group ID to allow inbound access. Ignore if for_sg is false."
}

variable "ingress_cidr" {
  type        = string
  default     = "0.0.0.0/32"
  description = "The IP address to allow inbound access. Ignore if for_ip is false."
}

variable "ingress_cidr_ipv6" {
  type        = string
  default     = "::/32"
  description = "The IP address to allow inbound access. Ignore if for_ip is false."
}

variable "ingress_from" {
  type        = number
  description = "The start port to allow inbound access."
}

variable "ingress_to" {
  type        = number
  description = "The end port to allow inbound access."
}

variable "ingress_protocol" {
  type        = string
  description = "The protocol to allow inbound access. Use protocol number unless it's icmp, icmpv6, tcp, udp, or all."
}

variable "egress_source_sg_id" {
  type        = string
  default     = "NONE"
  description = "The Security Group ID to allow outbound access. Ignore if for_sg is false."
}

variable "egress_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The IP address to allow outbound access. Ignore if for_ip is false."
}

variable "egress_cidr_ipv6" {
  type        = string
  default     = "::/0"
  description = "The IP address to allow outbound access. Ignore if for_ip is false."
}

variable "egress_from" {
  type        = number
  default     = 0
  description = "The start port to allow outbound access."
}

variable "egress_to" {
  type        = number
  default     = 65535
  description = "The end port to allow outbound access."
}

variable "egress_protocol" {
  type        = string
  default     = "all"
  description = "The protocol to allow outbound access. Use protocol number unless it's icmp, icmpv6, tcp, udp, or all."
}
