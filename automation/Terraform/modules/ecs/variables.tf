  
  variable "key_name" {
    default = "megh_key"
  }

  variable "instance_type" {
    default = "t2.micro"
  }

  variable "ecs_aws_ami" {
    default = "ami-1d668865"
  }

  variable "ecs_config" {
    default     = "echo '' > /etc/ecs/ecs.config"
    description = "Specify ecs configuration or get it from S3. Example: aws s3 cp s3://some-bucket/ecs.config /etc/ecs/ecs.config"
  } 
  
  variable "ecs_logging" {
    default     = "[\"json-file\",\"awslogs\"]"
    description = "Adding logging option to ECS that the Docker containers can use. It is possible to add fluentd as well"
  }
