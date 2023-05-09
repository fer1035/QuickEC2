variable "subnet" {
  type        = string
  description = "Subnet ID in which to place the instance."
}

variable "security_groups" {
  type        = list(string)
  description = "Security Groups to attach to the instance."
}

variable "ami" {
  type        = string
  default     = "ami-0022f774911c1d690"
  description = "AMI with which to launch the instance. The default is for Amazon Linux 2 in us-east-1."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance type with which to launch the instance"
}

variable "user_data" {
  type        = string
  description = "Commands to run when launching the instance."
  default     = <<EOF
#!/bin/bash
EOF
}

variable "public_key" {
  type        = string
  default     = null
  description = "SSH public key material to attach to the instance."
}

variable "key_pair_name" {
  type        = string
  default     = null
  description = "Existing SSH public key name to attach to the instance."
}

variable "managed_policy_arns" {
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  description = "List of managed policy ARNs to attach to the instance profile."
}

variable "inline_actions" {
  type        = list(string)
  default     = ["logs:List*"]
  description = "List of inline policy actions to attach to the instance profile."
}

variable "inline_resources" {
  type        = list(string)
  default     = ["*"]
  description = "List of inline policy resources to attach to the instance profile."
}
