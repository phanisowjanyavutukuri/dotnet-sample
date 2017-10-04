  
  data "aws_iam_role" "ecs_instance_role" {
    name = "ecsInstanceRole"
  }
 
  resource "aws_iam_instance_profile" "ecs" {
    name = "ecs_ec2_profile"
    path = "/"
    role = "${data.aws_iam_role.ecs_instance_role.name}"
  }

  resource "aws_iam_role_policy_attachment" "ecs_ec2_role" {
    role       = "${data.aws_iam_role.ecs_instance_role.id}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  }
