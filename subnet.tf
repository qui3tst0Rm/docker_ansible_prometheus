resource "aws_subnet" "public_1" {
    vpc_id = aws_vpc.ansible_docker_prometheus.vpc_id
    cidr_block = var.subnet-public-1-cidr
}