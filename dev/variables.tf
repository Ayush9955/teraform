variable "no_count" {
   default = 2
}

variable "env" {
   default = "dev"
}

variable "cidr" {
   default = ["172.16.1.0/24", "172.16.2.0/24"]
}

variable "az" {
   default = ["ap-south-1a", "ap-south-1b"]
}

variable "instance_count" {
     default = 2
}
variable "ami" {
     default = "ami-0f2e255ec956ade7f"
}
variable "instance_type" {
     default = "t2.micro"
}
variable "associate_public_ip_address" {
     default = true
}
