# ec2.tf

resource "aws_instance" "public_instance" {
  ami           = "ami-05c13eab67c5d8861"  # Updated AMI ID
  instance_type = "t2.micro"
  key_name      = "demoami"  # Use the existing key pair name
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "public-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              sudo service nginx start
              EOF
}

resource "aws_instance" "private_instance" {
  ami           = "ami-05c13eab67c5d8861"  # Updated AMI ID
  instance_type = "t2.micro"
  key_name      = "demoami"  # Use the existing key pair name
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name = "private-instance"
  }
}

