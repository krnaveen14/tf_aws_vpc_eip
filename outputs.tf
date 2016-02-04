output "vpc_id" {
  value = "${aws_vpc.mod.id}"
}

output "eip_allocation_ids" {
  value = "${join(",", aws_eip.nat.*.id)}"
}
