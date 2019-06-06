resource "aws_vpc" "default" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "subnet_a_gw" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.subnet_a_gw"]
}

resource "aws_eip" "unms_ip" {
  vpc = true
  instance                  = "${aws_instance.unms.id}"
  depends_on                = ["aws_internet_gateway.subnet_a_gw"]
}
