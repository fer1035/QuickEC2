resource "aws_key_pair" "key_pair" {
  count = var.public_key != null ? 1 : 0

  public_key = var.public_key
}