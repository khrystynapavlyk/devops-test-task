resource "aws_security_group" "sg_ec2" {
  name        = "${var.project_name}-${var.environment}-sg-ec2"
  description = "Controls access to the EC2"
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = ["8080"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_name}-${var.environment}-sg-ec2"
  }
}
