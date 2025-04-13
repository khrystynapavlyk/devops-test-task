resource "aws_key_pair" "ssh_key" {
  key_name   = "${var.project_name}-${var.environment}-key"
  public_key = var.ssh_public_key
}

resource "aws_instance" "ec2_instance" {
  subnet_id              = aws_subnet.public_subnet_1.id
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.sg_ec2.id]

  root_block_device {
    volume_type = "gp3"
    encrypted   = true
    volume_size = 30
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.ec2_instance.id
  domain   = "vpc"
}
