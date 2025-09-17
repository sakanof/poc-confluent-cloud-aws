# Public Subsnets
resource "aws_subnet" "public_az1" {
  availability_zone         = data.aws_availability_zones.azs.names[0]
  cidr_block                = var.public_az1_cidr_block
  vpc_id                    = aws_vpc.main.id

  map_public_ip_on_launch   = true
  
  tags = {
    "Name"                                      = "public-${data.aws_availability_zones.azs.names[0]}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.eks_name}"   = "owned" # owned || shared
  }
}

resource "aws_subnet" "public_az2" {
  availability_zone         = data.aws_availability_zones.azs.names[1]
  cidr_block                = var.public_az2_cidr_block
  vpc_id                    = aws_vpc.main.id

  map_public_ip_on_launch   = true
  
  tags = {
    "Name"                                      = "public-${data.aws_availability_zones.azs.names[1]}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.eks_name}"   = "owned" # owned || shared
  }
}

resource "aws_subnet" "public_az3" {
  availability_zone         = data.aws_availability_zones.azs.names[2]
  cidr_block                = var.public_az3_cidr_block
  vpc_id                    = aws_vpc.main.id

  map_public_ip_on_launch   = true
  
  tags = {
    "Name"                                      = "public-${data.aws_availability_zones.azs.names[2]}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.eks_name}"   = "owned" # owned || shared
  }
}


# Private Subsnets
resource "aws_subnet" "private_az1" {
  availability_zone = data.aws_availability_zones.azs.names[0]
  cidr_block        = var.private_az1_cidr_block
  vpc_id            = aws_vpc.main.id
  
  tags = {
    "Name"                                      = "private-${data.aws_availability_zones.azs.names[0]}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.eks_name}"   = "owned" # owned || shared
  }
}

resource "aws_subnet" "private_az2" {
  availability_zone = data.aws_availability_zones.azs.names[1]
  cidr_block        = var.private_az2_cidr_block
  vpc_id            = aws_vpc.main.id
  
  tags = {
    "Name"                                      = "private-${data.aws_availability_zones.azs.names[1]}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.eks_name}"   = "owned" # owned || shared
  }
}

resource "aws_subnet" "private_az3" {
  availability_zone = data.aws_availability_zones.azs.names[2]
  cidr_block        = var.private_az3_cidr_block
  vpc_id            = aws_vpc.main.id
  
  tags = {
    "Name"                                      = "private-${data.aws_availability_zones.azs.names[2]}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.eks_name}"   = "owned" # owned || shared
  }
}
