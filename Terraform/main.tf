provider "aws" {
  region  = "us-east-1"
#   profile = default
  
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.33.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "remotetfstates"
    key    = "path/tf.state"
    region =  "us-east-1"
    encrypt = true
  }
}
