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
  user_data     = null
  public_key    = null
  key_pair_name = null
  region        = "ap-southeast-1"
  subnet_az     = "ap-southeast-1a"
  ami           = "ami-067d12e172891a3e4"
}
