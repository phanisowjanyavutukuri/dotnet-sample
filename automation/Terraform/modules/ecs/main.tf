  
  module "ecr" {
   source = "../ecr"
  }
  
  
  resource "aws_ecs_cluster" "cluster" {
    name = "my-cluster"
    lifecycle {
      ignore_updates = true
    }
  } 
 
  resource "aws_ecs_task_definition" "task_def" {
    family = "my-task"
    container_definitions = "${file("task-definitions/test.json")}"
    lifecycle {
      ignore_updates = true
    }
  } 
 
  resource "aws_ecs_service" "test_service" {
    name            = "my-service"
    cluster         = "${aws_ecs_cluster.cluster.id}"
    task_definition = "${aws_ecs_task_definition.task_def.arn}"
    desired_count   = 1
    lifecycle {
      ignore_updates = true
    } 
  }
 
  resource "aws_instance" "ecs_ec2" {
    key_name             = "${var.key_name}"
    instance_type        = "${var.instance_type}"
    ami                  = "${var.ecs_aws_ami}"
    iam_instance_profile = "${aws_iam_instance_profile.ecs.name}"
    lifecycle {
      ignore_updates = true
    }
  user_data = <<EOF
  #!/bin/bash
  echo ECS_CLUSTER=${aws_ecs_cluster.cluster.name} >> /etc/ecs/ecs.config
   EOF
  }
