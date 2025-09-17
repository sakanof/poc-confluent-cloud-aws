resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_route" "route" {
  route_table_id            = aws_vpc.main.main_route_table_id
  gateway_id                = aws_internet_gateway.igw.id
  destination_cidr_block    = "0.0.0.0/0"
}
