module "vpc" {
  source = "../modules/common/VPC"
  cidr = var.cidr
  no_count = var.no_count
  az = var.az
  env = var.env
}

output "subnet_id" {
    value = "${module.vpc.subnet_id}"
}
output "security_id" {
    value = "${module.vpc.security_id}"
}

module "ec2" {
   source = "../modules/common/EC2"
   instance_count = var.instance_count
   ami = var.ami
   instance_type = var.instance_type 
   az = var.az
   associate_public_ip_address = var.associate_public_ip_address
   security_groups = "${module.vpc.security_id}"
   subnet_id = "${module.vpc.subnet_id}"
   env = var.env
}
