resource "aws_s3_bucket" "terraform_state" {
  bucket        = var.s3_tfstate_bucket_name
  force_destroy = true

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "${var.project_name}${var.environment}-terraform-state"
  }

}

resource "aws_s3_bucket_versioning" "versioning_terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }

}
