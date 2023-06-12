terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "local" {}
}
variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "ssh" {}
variable "rdp" {}
variable "ec2" {}
provider "aws" {
  region     = var.ec2.region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  default_tags {
    tags = {
      Name = "QuickEC2"
    }
  }
}

module "vpc" {
  source    = "./ec2_vpc"
  subnet_az = var.ec2.subnet_az
}
module "ssh" {
  source           = "./ec2_security_group"
  ingress_from     = var.ssh.ingress_from
  ingress_to       = var.ssh.ingress_to
  ingress_protocol = var.ssh.ingress_protocol
  ingress_cidr     = var.ssh.ingress_cidr
  sg_description   = var.ssh.sg_description
  vpc_id           = module.vpc.vpc_id
}
module "rdp" {
  source           = "./ec2_security_group"
  ingress_from     = var.rdp.ingress_from
  ingress_to       = var.rdp.ingress_to
  ingress_protocol = var.rdp.ingress_protocol
  ingress_cidr     = var.rdp.ingress_cidr
  sg_description   = var.rdp.sg_description
  vpc_id           = module.vpc.vpc_id
}
module "ec2" {
  source          = "./ec2_instance"
  user_data       = var.ec2.user_data
  public_key      = var.ec2.public_key
  key_pair_name   = var.ec2.key_pair_name
  ami             = var.ec2.ami
  subnet          = module.vpc.subnet_id
  security_groups = [module.ssh.security_group_id, module.rdp.security_group_id]
}

output "public_hostname" {
  value = module.ec2.public_dns
}
output "ssh_connect_if_linux" {
  value = "ssh -i <private/key/path> ec2-user@${module.ec2.public_dns}"
}
output "get_Administrator_password_if_windows" {
  value = "aws ec2 get-password-data --instance-id ${element(split("/", module.ec2.instance_arn), 1)} --priv-launch-key <private/key/path> [--profile <aws-cli-profile>]"
}
