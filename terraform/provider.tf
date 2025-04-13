provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = var.environment
      Product     = var.project_name
    }
  }
}
