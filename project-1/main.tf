resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet_A" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_A_cidr
  availability_zone = var.subnet_A_az

  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_B" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_B_cidr
  availability_zone = var.subnet_B_az

  map_public_ip_on_launch = true
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

}

resource "aws_route_table_association" "rta_a" {
  subnet_id      = aws_subnet.subnet_A.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rta_b" {
  subnet_id      = aws_subnet.subnet_B.id
  route_table_id = aws_route_table.rt.id
}