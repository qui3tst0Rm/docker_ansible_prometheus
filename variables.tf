variable "region" {
  default = "eu-west-2"
}

variable "vpc-cidr" {
  default     = "172.28.0.0/16"
  description = "cidr for the vpc"
}

variable "subnet-public-1-cidr" {
  default     = "172.28.8.0/24"
  description = "subnet-public-1-cidr-var"
}

/*variable "subnet-public-2-cidr" {
  default     = "172.28.16.0/24"
  description = "subnet-public-2-cidr-var"
}*/

variable "ec2-instance-ami" {
  default     = "ami-0a13d44dccf1f5cf6"
  description = "ami for ec2 instance"
}

variable "task-instance-type" {
  default     = "t2.micro"
  description = "instance type"
}

variable "key_name" {
  default     = "terraform2"
  description = "key name"
}

variable "private_key" {
  default     = "~/.ssh/terraform2.pem"
  description = "private_key"
}

variable "instance_names" {
  description = "names for ec2 instances"
  type        = list(string)
  default     = ["Ansible_Docker_Prometheus-Box"]
}

variable "zone1" {
  description = "variable for the eu-west-2a availability zone"
  default     = "eu-west-2a"
}

/*variable "instance_names" {
  description = "names for ec2 instances"
  type        = list(string)
  default     = ["Ansible_Control_Station", "Docker-Prometheus-Box"]
}*/





