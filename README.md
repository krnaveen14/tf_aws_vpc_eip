base vpc terraform module
===========

A terraform module to provide a VPC in AWS, with Elastic IPs.

Use case
--------

This module is for use as a base layer that is run independently of other modules.  By using
remote state you can allow other modules to use the vpc-id created here.  By separating out
just the VPC and the EIP you can do a full `terraform destroy` on other modules while leaving
the same EIPs allocated.  If the EIPs are torn down then they are lost, and this can be a
problem if those IPs are being used in IP whitelisting in other on-premise datacentres.


Module Input Variables
----------------------

- `name` - vpc name
- `cidr` - vpc cidr
- `enable_dns_hostnames` - should be true if you want to use private DNS within the VPC
- `enable_dns_support` - should be true if you want to use private DNS within the VPC
- `eip_count` - the number of EIPs to allocate
- `env` - the environment name, used for tagging
- `project` - the project name, used for tagging


Usage
-----

```js
module "vpc" {
  source = "github.com/bjss/tf_aws_vpc"

  name = "my-vpc-${var.env}"
  cidr = "10.0.0.0/16"
  eip_count = "${length(split(",", var.availability_zones))}"

  env = "${var.env}"
  project = "my_system_x"
}
```

Outputs
=======

 - `vpc_id` - does what it says on the tin
 - `eip_allocation_ids` - comma separated list of EIP allocation ids

Authors
=======

Originally created by [David Roussel](https://github.com/diroussel)

License
=======

Apache 2 Licensed. See LICENSE for full details.
