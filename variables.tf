variable "region" {
    default = "eu-west-2"
}

variable "vpc-cidr" {
    default = "172.28.0.0/16"
    description = "cidr for the vpc"
}

variable "subnet-public-1-cidr" {
    default = "172.28.8.0/24"
    description = "subnet-public-1-cidr-var"
}

variable "task-ami" {
    default = "ami-0c3e74fa87d2a4227" # it seems this ami does not exist fins new ami to use
    description = "ami for task"
}

variable "task-instance-type" {
    default = "t2.micro"
    description = "instance type"
}

variable "key_name" {
    default = "terraform2"
    description = "key name"
}

variable "private_key" {
  default = "~/.ssh/terraform2.pem"
}

variable "instance_names" {
    description = "names for ec2 instances"
    type = list(string)
    default = ["Docker-Box"]
}
