resource "aws_vpc" "vpc_nginx" {
  cidr_block         = "10.0.0.0/16"
  enable_dns_support = true
  tags = {
    environment = "dev"
  }
}

resource "aws_subnet" "subnet_nginx" {
  vpc_id     = aws_vpc.vpc_nginx.id
  cidr_block = "10.0.0.0/24"
  tags = {
    environment = "dev"
  }
}

resource "aws_security_group" "sg_nginx" {
  vpc_id = aws_vpc.vpc_nginx.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    environment = "dev"
  }
}

resource "aws_route_table" "rt_nginx" {
  vpc_id = aws_vpc.vpc_nginx.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_nginx.id
  }
  tags = {
    environment = "dev"
  }
}

resource "aws_internet_gateway" "igw_nginx" {
  vpc_id = aws_vpc.vpc_nginx.id
  tags = {
    environment = "dev"
  }
}

resource "aws_instance" "nginx" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_nginx.id
  vpc_security_group_ids = [aws_security_group.sg_nginx.id]
  tags = {
    environment = "dev"
  }
}

output "public_ip" {
  value = aws_instance.nginx.public_ip
}

output "public_dns" {
  value = aws_instance.nginx.public_dns
}

