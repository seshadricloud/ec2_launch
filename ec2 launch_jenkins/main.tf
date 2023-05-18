provider "aws" {
  region = "sa-east-1"
}

resource "aws_key_pair" "example" {
  key_name   = var.keypair_name
  public_key = file(var.public_key_path)
  # Uncomment the following line and replace the file path with your private key file location
  # private_key = file(var.private_key_path)
}

resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.example.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.example.id]
  user_data              = var.user_data

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "example" {
  name        = var.security_group_name
  description = "Security group for EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
