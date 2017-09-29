  provider "aws" {
    region     = "${var.aws_region}"
    shared_credentials_file = "${var.credentials_path}"
    profile = "default"
  }

  module "ecs" {
    source = "modules/ecs"
  }
     
