

resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "matorz-public"
  image_id      = "${local.base_ami}"
  instance_type = "t2.nano"
  iam_instance_profile = "matorz-manual"
  key_name = "matorz-manual"
  security_groups = ["${aws_security_group.matorz-pub-1-sg.id}","${aws_security_group.matorz-pub-2-sg.id}"]
  associate_public_ip_address = true

}

resource "aws_launch_configuration" "as_conf-priv" {
  name_prefix   = "matorz-priv"
  image_id      = "${local.base_ami}"
  instance_type = "t2.nano"
  iam_instance_profile = "matorz-manual"
  key_name = "matorz-manual"
  security_groups = ["${aws_security_group.matorz-priv-1-sg.id}"]
  associate_public_ip_address = false

}
 resource "aws_autoscaling_group" "as" {
  name                 = "matorz-as-pub"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  vpc_zone_identifier  = ["${aws_subnet.matorz-pub-sub-1.id}"]
  min_size             = 2
  max_size             = 2
  availability_zones   = ["eu-west-1a"]

} 

 resource "aws_autoscaling_group" "as-priv" {
  name                 = "matorz-as-priv"
  launch_configuration = "${aws_launch_configuration.as_conf-priv.name}"
  vpc_zone_identifier  = ["${aws_subnet.matorz-priv-sub-1.id}"]
  min_size             = 1
  max_size             = 1
  availability_zones   = ["eu-west-1a"]

} 