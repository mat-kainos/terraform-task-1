resource "aws_vpc" "vpc" {
  cidr_block       = "${local.cidr_vpc}"
  tags = {
    Name = "matorz-vpc-terraform"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.matorz-pub-sub-1.id}"
  route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.matorz-pub-sub-2.id}"
  route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.matorz-priv-sub-1.id}"
  route_table_id = "${aws_route_table.rt-priv.id}"
}