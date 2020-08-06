##############################################
##              Internet Gateway            ##
##############################################

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ansible_docker_prometheus_vpc.id
  tags = {
    Name = "vpc-ansible-docker-prometheus-igw"
  }
}

##############################################
##       Network Access Control List        ##
##############################################

resource "aws_network_acl" "nacl_b_all" {
  vpc_id = aws_vpc.ansible_docker_prometheus_vpc.id

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    rule_no    = 2
    action     = "allow"
  }
  ingress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    rule_no    = 1
    action     = "allow"
  }
  tags = {
    Name = "open_nacl"
  }
}

##############################################
##              Route Tables                ##
##############################################

resource "aws_route_table" "routetb_A_public" {
  vpc_id = aws_vpc.ansible_docker_prometheus_vpc.id

  tags = {
    Name = "routetb_A_public"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

##############################################
##        Route Tables Association          ##
##############################################

resource "aws_route_table_association" "route-A-pub" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.routetb_A_public.id
}


##############################################
##            Security Groups               ##
##############################################

##### Sec group for docker box #####
resource "aws_security_group" "group_1" {
  name        = "sec_group_1"
  description = "sec group for docker box"
  vpc_id      = aws_vpc.ansible_docker_prometheus_vpc.id

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

