resource "aws_network_interface" "netif" {
  subnet_id       = var.subnet
  security_groups = var.security_groups
  /* private_ips     = var.instance_ips */
}
