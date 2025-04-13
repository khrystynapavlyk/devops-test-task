variable "region" {
  description = "The name of the AWS Region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "s3_tfstate_bucket_name" {
  description = "The name of the AWS S3 bucket to store Terraform state files"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}

variable "allowed_ssh_ips" {
  description = "List of IP addresses allowed to SSH into the EC2 instances"
  type        = list(string)
}

variable "ssh_public_key" {
  description = "SSH public key for EC2 instances"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
