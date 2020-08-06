resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.ansible_docker_prometheus_vpc.id
  cidr_block        = var.subnet-public-1-cidr
  availability_zone = var.zone1

  tags = {
    Name = "public-subnet-1"
  }
  map_public_ip_on_launch = true
}

/*resource "aws_subnet" "public_2" {
    vpc_id = aws_vpc.ansible_docker_prometheus_vpc.id
    cidr_block = var.subnet-public-2-cidr
}*/
