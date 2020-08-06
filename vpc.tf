provider "aws" {
  #version = 
  region = var.region
}

resource "aws_vpc" "ansible_docker_prometheus_vpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_hostnames = true

  tags = {
    Name = "ansible_docker_prometheus_vpc"
  }
}
