resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.ansible_docker_prometheus_vpc.id
  cidr_block = var.subnet-public-1-cidr
}

/*resource "aws_subnet" "public_2" {
    vpc_id = aws_vpc.ansible_docker_prometheus_vpc.id
    cidr_block = var.subnet-public-2-cidr
}*/
