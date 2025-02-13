﻿# Terraform Secure Nginx setup

1. **VPC**:
    - **aws_vpc.vpc_nginx**: Creates a Virtual Private Cloud (VPC) with a CIDR block of 10.0.0.0/16 and DNS support enabled. It is tagged with environment = "dev".
2. **Subnet**:
    - **aws_subnet.subnet_nginx**: Creates a subnet within the VPC with a CIDR block of 10.0.0.0/24. It is tagged with environment = "dev".
3. **Security Group**:
    - **aws_security_group.sg_nginx**: Creates a security group within the VPC that allows inbound traffic on port 80 (HTTP) from any IP address (0.0.0.0/0) and allows all outbound traffic. It is tagged with environment = "dev".
4. **Route Table**:
    - **aws_route_table.rt_nginx**: Creates a route table for the VPC with a route that directs all traffic (0.0.0.0/0) to the internet gateway. It is tagged with environment = "dev".
5. **Internet Gateway**:
    - **aws_internet_gateway.igw_nginx**: Creates an internet gateway for the VPC. It is tagged with environment = "dev".
6. **EC2 Instance**:
    - **aws_instance.nginx**: Launches an EC2 instance using the specified Amazon Machine Image (AMI) ID (ami-0c55b159cbfafe1f0) and instance type (t2.micro). The instance is placed in the created subnet and associated with the security group. It is tagged with environment = "dev".
7. **Outputs**:
    - **public_ip**: Outputs the public IP address of the EC2 instance.
    - **public_dns**: Outputs the public DNS name of the EC2 instance.
  
# Architecture

![image](https://github.com/user-attachments/assets/b074db9b-744e-4007-a7bd-c626aff746fd)
