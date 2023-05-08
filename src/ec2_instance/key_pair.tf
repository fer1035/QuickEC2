resource "aws_key_pair" "key_pair" {
  public_key = var.public_key
}