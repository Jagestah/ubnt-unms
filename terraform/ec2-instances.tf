data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "unms" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.subnet_a.id}"
  vpc_security_group_ids      = ["${aws_security_group.allow_80_443.id}"]
  key_name                    = "paradigm"
  tags = {
    Name = "UNMS"
  }
}
