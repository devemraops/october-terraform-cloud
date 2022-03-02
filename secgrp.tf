resource "aws_vpc" "main" {
  cidr_block              = "10.0.0.0/16"
  enable_dns_support      = true
  enable_dns_hostnames    = true
  enable_internet_gateway = true
  resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1a"

  resource "aws_subnet" "private" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.2.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1b"
    }
  }
}
// resource "aws_nat_gateway" "example" {
//   connectivity_type = "private"
//   subnet_id         = aws_subnet.public.id
// }

// resource "aws_internet_gateway" "gw" {
//   vpc_id = aws_vpc.main.id
// }


// resource "aws_route_table" "star-route" {
//   vpc_id    = aws_vpc.main.id

//   route {
//     cidr_block = "0.0.0.0/0"
//   }
// }
// resource "aws_route_table_association" "a" {
//   subnet_id       = aws_subnet.private.id
//   route_table_id  = aws_route_table.star-route.id
//   aws_nat_gateway = aws_nat_gateway.example.id

// }
// }
// resource "aws_security_group" "master" {
// name   = "httpd-scgrp"
// vpc_id = aws_vpc.main.id



// dynamic "ingress" {
// for_each = local.ingress_rules
// content {
// from_port   = ingress.value.port
// to_port     = ingress.value.port
// protocol    = "tcp"
// cidr_blocks = ["0.0.0.0/0"]
// }
// }
// }
// locals {
// ingress_rules = [{
// port = 443
// },
// {
// port = 80
// },
// {
// port = 22
// }]
// }