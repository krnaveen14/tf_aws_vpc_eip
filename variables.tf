variable "name" { }
variable "cidr" { }
variable "eip_count" {
  description = "The number of Elastic IPs to allocate to this VPC"
  default = "1"
}
variable "enable_dns_hostnames" {
  description = "should be true if you want to use private DNS within the VPC"
  default = false
}
variable "enable_dns_support" {
  description = "should be true if you want to use private DNS within the VPC"
  default = false
}
variable "env" {
  description = "environment name, for use in tags"
  default = ""
}
variable "project" {
  description = "project name, for use in tags"
  default = ""
}
