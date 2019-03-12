resource "aws_eip" "nat_gw_ip" {
    tags {
        Name = "matorz-nat-gw-ip"
    }
}

resource "aws_eip" "lb_ip" {
    tags {
        Name = "matorz-lb-ip"
    }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "matorz-igw"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat_gw_ip.id}"
  subnet_id     = "${aws_subnet.matorz-pub-sub-1.id}"
  tags {
      Name = "matorz-nat-gw"
  }
}
resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "matorz-rt-pub"
  }
}


resource "aws_route_table" "rt-priv" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

  tags = {
    Name = "matorz-rt-priv"
  }
}

