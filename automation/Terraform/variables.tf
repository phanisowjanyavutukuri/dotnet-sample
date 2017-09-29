  variable "aws_region" {}
  
  variable "credentials_path" {
    default = "/home/ubuntu/.aws/credentials"
  }
 
  variable "ecs_ami" {
    default = "ami-1d668865"
  }
 
  variable "subnet_id" {
    default = "subnet-9e4762c7"
  }
 
  variable "security_group_id" {
    default = "sg-5ec56439"
  }
 
  variable "key_name" {
    default = "megh_key"
  }

  variable "instance_type" {
    default = "t2.micro"
  }

