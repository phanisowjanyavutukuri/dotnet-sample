  
  module "ecr" {
   source = "../ecr"
  }

  resource "aws_ecs_cluster" "cluster" {
    name = "megh-cluster"
  } 
 
  resource "aws_ecs_task_definition" "test" {
    family = "test"
    container_definitions = "${file("task-definitions/test.json")}"
  } 
 
  resource "aws_ecs_service" "test_service" {
    name            = "megh-service"
    cluster         = "${aws_ecs_cluster.cluster.id}"
    task_definition = "${aws_ecs_task_definition.megh-ecr.arn}"
    desired_count   = 1
  } 
