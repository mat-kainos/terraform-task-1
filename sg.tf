resource "aws_security_group" "matorz-pub-1-sg" {
  name   = "matorz-pub-1-sg"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "matorz-pub-1-sg"
  }
}

resource "aws_security_group_rule" "ssh-rule" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.matorz-pub-1-sg.id}"
}

resource "aws_security_group_rule" "ssh-selfrule" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  self        = true
  security_group_id = "${aws_security_group.matorz-pub-1-sg.id}"
}

resource "aws_security_group_rule" "internet-exit" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.matorz-pub-1-sg.id}"
}