# ##############################################
# # Create ECR repos for storing Docker images #
# ##############################################

# resource "aws_ecr_repository" "app" {
#   name                 = var.ecr_repository_name
#   image_tag_mutability = "MUTABLE"
#   force_delete         = true

#   image_scanning_configuration {
#     # NOTE: Update to true for real deployments.
#     scan_on_push = false
#   }
# }

# resource "aws_ecr_repository" "proxy" {
#   name                 = var.ecr_repository_proxy_name
#   image_tag_mutability = "MUTABLE"
#   force_delete         = true

#   image_scanning_configuration {
#     # NOTE: Update to true for real deployments.
#     scan_on_push = false
#   }
# }