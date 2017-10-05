 resource "aws_ecr_repository" "repo" {
   name = "my-ecr"
   lifecycle {
     ignore_updates = true
   }
 }
