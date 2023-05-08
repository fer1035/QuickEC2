resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_egress_only_internet_gateway" "egress" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_eip" "eip" {
  vpc = true
  depends_on = [
    aws_internet_gateway.igw
  ]
}
