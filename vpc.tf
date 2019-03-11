resource "aws_vpc" "vpc" {
  cidr_block       = "${local.cidr_vpc}"
  tags = {
    Name = "matorz-vpc-terraform"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "matorz-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "matorz-rt"
    Test = "test"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.matorz-pub-sub-1.id}"
  route_table_id = "${aws_route_table.rt.id}"
}