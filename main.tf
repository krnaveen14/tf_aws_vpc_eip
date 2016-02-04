resource "aws_vpc" "mod" {
  cidr_block = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support = "${var.enable_dns_support}"
  tags {
    Name = "${var.name}"
    project = "${var.project}"
    tf-module = "tf_aws_vpc"
    env = "${var.env}"
  }
}

resource "aws_eip" "nat" {
  vpc = true
  count = "${var.eip_count}"
}
