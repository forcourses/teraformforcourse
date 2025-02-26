terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "17.9.0"
    }
  }
   backend "s3" {
    bucket         = "webacademystatebucket"
    key            = "webacademy/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }
}