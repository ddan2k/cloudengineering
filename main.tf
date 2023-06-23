#Wybór pierwszego regionu
provider "aws" {
    region  = "eu-central-1"  #Frankfurt
    version = "~> 5.5.0"
}

#Utworzenie EC2
resource "aws_instance" "ec2-frankfurt01" {
    ami             = "ami-03cbad7144aeda3eb"  #Red Hat Linux
    instance_type   = "t2.micro"
    key_name        = "frankfurt-instance"
    subnet_id       = aws_subnet.subnet_1.id

    security_groups = [aws_security_group.security01]

    tags            = {
        Name        = "Server01" 
    } 

}

#Utworzenie security group
resource "aws_security_group" "security01" {
    name        = "security-group01"
    description = "Access via SSH Key" 

    ingress {
        description = "Allow SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

#Utworzenie VPC
resource "aws_vpc" "my-vpc1" {
    cidr_block = "172.20.0.0/16"
}

#Utworzenie podsieci
resource "aws_subnet" "subnet01-frankfurt" {
    vpc_id            = aws_vpc.my_vpc.id
    cidr_block        = "172.20.1.0/24"
    availability_zone = "eu-central-2a"
}

output "ec2_public_dns" {
    value = aws_instance.ec2-frankfurt01
}