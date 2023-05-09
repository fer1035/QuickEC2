resource "aws_instance" "instance" {
  ami                  = var.ami
  instance_type        = var.instance_type
  key_name             = var.public_key == null ? var.key_pair_name == null ? null : var.key_pair_name : aws_key_pair.key_pair[0].key_name
  iam_instance_profile = aws_iam_instance_profile.profile.name
  user_data            = var.user_data

  network_interface {
    network_interface_id  = aws_network_interface.netif.id
    device_index          = 0
    delete_on_termination = false
  }
}
