  provider "aws" {
    region     = "${var.aws_region}"
    shared_credentials_file = "${var.credentials_path}"
    profile = "default"
  }
   
  resource "aws_instance" "ecs" {
    ami           = "${var.ecs_ami}"
    subnet_id     = "${var.subnet_id}"
    security_groups = ["${var.security_group_id}"]
    key_name      = "${var.key_name}"
    instance_type = "${var.instance_type}"
  }
 

  module "ecs" {
    source = "modules/ecs"
  }
     
