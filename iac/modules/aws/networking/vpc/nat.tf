resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.vpc_name}-nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  # Needs to be on a public subnet in order to use public IP address
  subnet_id     = aws_subnet.public_az1.id

  tags = {
    Name = "poc-aws-msk-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
