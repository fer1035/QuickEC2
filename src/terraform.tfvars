ssh = {
  ingress_from     = 22
  ingress_to       = 22
  ingress_protocol = "tcp"
  ingress_cidr     = "0.0.0.0/0"
  sg_description   = "SSH"
}

rdp = {
  ingress_from     = 3389
  ingress_to       = 3389
  ingress_protocol = "tcp"
  ingress_cidr     = "0.0.0.0/0"
  sg_description   = "RDP"
}

ec2 = {
  ami              = "<REGIONAL-AMI-ID>"
  aws_cli_profile  = "default"
  region           = "us-east-1"
  private_key_path = "<PRIVATE-KEY-PATH>"
  public_key       = "<PUBLIC-KEY-CONTENT>"
  user_data        = null
}
