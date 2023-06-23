#Wybór pierwszego regionu
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws" 
            version = "~> 5.5.0"
        }
    }
}

#Deklaracja dostawcy chmurowego
provider "aws" {
    region = "eu-central-1" #Frankfurt
}


#Utworzenie EC2
resource "aws_instance" "ec2-frankfurt01" {
    ami             = "ami-03cbad7144aeda3eb"  #Red Hat Linux
    instance_type   = "t2.micro"
    key_name        = "frankfurt-instance"

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

output "ec2_public_dns" {
    value = aws_instance.ec2-frankfurt01
}