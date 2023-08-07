terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Project = "Pratical DevOps for Dev"
      Org = "HNVN"
    }
  }
}

# Virtual network
resource "aws_vpc" "msavnet" {
  cidr_block = var.vnet_cidr_block
  tags = var.vpc_tags
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.msavnet.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true
  enable_resource_name_dns_a_record_on_launch = true
  tags = var.public_subnet_tags
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.msavnet.id
  cidr_block = var.private_subnet_cidr
  tags = var.private_subnet_tags
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.msavnet.id
}

resource "aws_instance" "cicd_agent" {
  instance_type = "t2.micro"
}