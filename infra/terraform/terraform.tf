terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.50.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-remote-state-bucket-sofia-kalinina"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }
}
