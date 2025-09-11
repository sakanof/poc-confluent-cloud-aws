resource "aws_route_table" "private" {
  vpc_id    = aws_vpc.main.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

resource "aws_route_table" "public" {
  vpc_id    = aws_vpc.main.id

  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table_association" "private_az1" {
  subnet_id         = aws_subnet.private_az1.id
  route_table_id    = aws_route_table.private.id
}

resource "aws_route_table_association" "private_az2" {
  subnet_id         = aws_subnet.private_az2.id
  route_table_id    = aws_route_table.private.id
}

resource "aws_route_table_association" "private_az3" {
  subnet_id         = aws_subnet.private_az3.id
  route_table_id    = aws_route_table.private.id
}

resource "aws_route_table_association" "public_az1" {
  subnet_id         = aws_subnet.public_az1.id
  route_table_id    = aws_route_table.public.id
}

resource "aws_route_table_association" "public_az2" {
  subnet_id         = aws_subnet.public_az2.id
  route_table_id    = aws_route_table.public.id
}

resource "aws_route_table_association" "public_az3" {
  subnet_id         = aws_subnet.public_az3.id
  route_table_id    = aws_route_table.public.id
}
