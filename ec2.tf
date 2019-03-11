resource "aws_instance" "first" {
  ami           = "${local.base_ami}"
  instance_type = "t2.nano"
  user_data = "${file("create-ssh.sh")}"
  vpc_security_group_ids      = ["${aws_security_group.matorz-pub-1-sg.id}"]
  subnet_id                   = "${aws_subnet.matorz-pub-sub-1.id}"
  associate_public_ip_address = true

  tags = {
    Name = "matorz-test"
  }
}
