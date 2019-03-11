resource "aws_subnet" "matorz-pub-sub-1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${local.cidr_sub_pub_1}"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true

  tags {
    Name = "matorz-pub-sub-1"
    VPC  = "${aws_vpc.vpc.tags.Name}"
  }
}

resource "aws_subnet" "matorz-pub-sub-2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${local.cidr_sub_pub_2}"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true

  tags {
    Name = "matorz-pub-sub-2"
    VPC  = "${aws_vpc.vpc.tags.Name}"
  }
}

resource "aws_subnet" "matorz-priv-sub-1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${local.cidr_sub_priv_1}"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = false

  tags {
    Name = "matorz-priv-sub-1"
    VPC  = "${aws_vpc.vpc.tags.Name}"
  }
}
