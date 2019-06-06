resource "aws_route53_zone" "pt_public" {
  name = "paradigm-technology.com"
}

resource "aws_route53_record" "ubnt_unms_dns" {
  zone_id = "${aws_route53_zone.pt_public.zone_id}"
  name    = "unms.paradigm-technology.com"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_instance.unms.public_dns}"]
}
