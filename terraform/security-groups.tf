resource "aws_security_group" "allow_80_443" {
  name          = "allow_80_and_443"
  description   = "Allow 80 and 443 for inform and dashboard connections"
  vpc_id        = "${aws_vpc.default.id}"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_80_and_443"
  }
}
