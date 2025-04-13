terraform {
  required_version = ">= 1.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.50"
    }
  }

  backend "s3" {
    bucket       = "opsentra-terraform-state-dev"
    key          = "dev/dev.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
  }

}
