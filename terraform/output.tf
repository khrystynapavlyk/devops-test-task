output "elastic_ip" {
  value       = aws_eip.eip.public_ip
  description = "Public ELastic IP of the EC2 instance"
}
