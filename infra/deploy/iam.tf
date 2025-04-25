#######################################################################
# # Create IAM user and policies for Continuous Deployment (CD) account #
# #######################################################################

# resource "aws_iam_user" "cd" {
#   name = "recipe-app-api-cd"
# }

# data "aws_iam_policy_document" "cd" {
#   statement {
#     effect = "Allow"
#     actions = [
#       "s3:GetObject"
#     ]
#     resources = ["arn:aws:s3:::${var.bucket_name}/*"]
    
#   }

# statement {
#     effect = "Allow"
#     actions = [
#       "iam:ListInstanceProfilesForRole",
#       "iam:ListAttachedRolePolicies",
#       "iam:DeleteRole",
#       "iam:ListPolicyVersions",
#       "iam:DeletePolicy",
#       "iam:DetachRolePolicy",
#       "iam:ListRolePolicies",
#       "iam:GetRole",
#       "iam:GetPolicyVersion",
#       "iam:GetPolicy",
#       "iam:CreateRole",
#       "iam:CreatePolicy",
#       "iam:AttachRolePolicy",
#       "iam:TagRole",
#       "iam:TagPolicy",
#       "iam:PassRole",
#       "iam:CreateRole",
#       "iam:CreatePolicy",
#       "iam:AttachRolePolicy",
#       "logs:CreateLogGroup",
#       "ecs:CreateCluster",
#       "rds:CreateDBSubnetGroup"
#        # Ensure this is included
#     ]
#     resources = ["*"]
#   }
# }

# resource "aws_iam_policy" "cd" {
#   name        = "${aws_iam_user.cd.name}-iam"
#   description = "Allow user to manage IAM resources"
#   policy      = data.aws_iam_policy_document.cd.json
# }
# resource "aws_iam_user_policy_attachment" "cd" {
#   user       = aws_iam_user.cd.name
#   policy_arn = aws_iam_policy.cd.arn
# }

# resource "aws_iam_access_key" "cd" {
#   user = aws_iam_user.cd.name
# }
# resource "aws_iam_user" "cd" {
#   name = "recipe-app-api-cd"
# }

# data "aws_iam_policy_document" "cd" {
#   statement {
#     effect = "Allow"
#     actions = [
#       "s3:GetObject"
#     ]
#     resources = ["arn:aws:s3:::${var.bucket_name}/*"]
    
#   }

# statement {
#     effect = "Allow"
#     actions = [
#       "iam:ListInstanceProfilesForRole",
#       "iam:ListAttachedRolePolicies",
#       "iam:DeleteRole",
#       "iam:ListPolicyVersions",
#       "iam:DeletePolicy",
#       "iam:DetachRolePolicy",
#       "iam:ListRolePolicies",
#       "iam:GetRole",
#       "iam:GetPolicyVersion",
#       "iam:GetPolicy",
#       "iam:CreateRole",
#       "iam:CreatePolicy",
#       "iam:AttachRolePolicy",
#       "iam:TagRole",
#       "iam:TagPolicy",
#       "iam:PassRole",
#       "iam:CreateRole",
#       "iam:CreatePolicy",
#       "iam:AttachRolePolicy",
#       "logs:CreateLogGroup",
#       "ecs:CreateCluster",
#       "rds:CreateDBSubnetGroup"
#        # Ensure this is included
#     ]
#     resources = ["*"]
#   }
# }

# resource "aws_iam_policy" "cd" {
#   name        = "${aws_iam_user.cd.name}-iam"
#   description = "Allow user to manage IAM resources"
#   policy      = data.aws_iam_policy_document.cd.json
# }
# resource "aws_iam_user_policy_attachment" "cd" {
#   user       = aws_iam_user.cd.name
#   policy_arn = aws_iam_policy.cd.arn
# }

# resource "aws_iam_access_key" "cd" {
#   user = aws_iam_user.cd.name
# }

# # #########################################################
# # # Policy for Terraform backend to S3 and DynamoDB access #
# # #########################################################

# # data "aws_iam_policy_document" "tf_backend" {
# #   statement {
# #     effect    = "Allow"
# #     actions   = ["s3:ListBucket", "s3:GetObject"]

# #     resources = ["arn:aws:s3:::${var.bucket_name}"]
# #   }

# #   statement {
# #     effect  = "Allow"
# #     actions = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
# #     resources = [

# #       "arn:aws:s3:::${var.bucket_name}/tf-state-deploy/*",
# #       "arn:aws:s3:::${var.bucket_name}/tf-state-deploy-env/*"
# #     ]

# #   statement {
# #     effect = "Allow"
# #     actions = [
# #       "dynamodb:DescribeTable",
# #       "dynamodb:GetItem",
# #       "dynamodb:PutItem",
# #       "dynamodb:DeleteItem"
# #     ]
# #     resources = ["arn:aws:dynamodb:*:*:table/${var.dynamodb_table_name}"]
# #   }
# # }

# # resource "aws_iam_policy" "tf_backend" {
# #   name        = "${aws_iam_user.cd.name}-tf-s3-dynamodb"
# #   description = "Allow user to use S3 and DynamoDB for TF backend resources"
# #   policy      = data.aws_iam_policy_document.tf_backend.json
# # }

# # resource "aws_iam_user_policy_attachment" "tf_backend" {
# #   user       = aws_iam_user.cd.name
# #   policy_arn = aws_iam_policy.tf_backend.arn
# # }

# # #########################
# # # Policy for ECR access #
# # #########################

# # data "aws_iam_policy_document" "ecr" {
# #   statement {
# #     effect    = "Allow"
# #     actions   = ["ecr:GetAuthorizationToken"]
# #     resources = ["*"]
# #   }

# #   statement {
# #     effect = "Allow"
# #     actions = [
# #       "ecr:CreateRepository", # Allow repository creation
# #       "ecr:CompleteLayerUpload",
# #       "ecr:UploadLayerPart",
# #       "ecr:InitiateLayerUpload",
# #       "ecr:BatchCheckLayerAvailability",
# #       "ecr:PutImage"
# #     ]
# #     resources = [
# #       "arn:aws:ecr:*:*:*", # Account-level ARN for CreateRepository
# #       "arn:aws:ecr:*:*:repository/*"
# #     ]
# #   }

# #   statement {
# #     effect = "Allow"
# #     actions = [
# #       "ecr:DeleteRepository",
# #       "ecr:DescribeRepositories",
# #       "ecr:ListTagsForResource",
# #       "ecr:TagResource",
# #       "ecr:UntagResource"
# #     ]
# #     resources = ["arn:aws:ecr:*:*:repository/*"]
# #   }
# # }

# # resource "aws_iam_policy" "ecr" {
# #   name        = "${aws_iam_user.cd.name}-ecr"
# #   description = "Allow user to manage ECR resources"
# #   policy      = data.aws_iam_policy_document.ecr.json
# # }

# # resource "aws_iam_user_policy_attachment" "ecr" {
# #   user       = aws_iam_user.cd.name
# #   policy_arn = aws_iam_policy.ecr.arn
# # }

# #########################
# # Policy for IAM access #
# #########################

# data "aws_iam_policy_document" "iam" {
#   statement {
#     effect = "Allow"
#     actions = [
#       "iam:ListInstanceProfilesForRole",
#       "iam:ListAttachedRolePolicies",
#       "iam:DeleteRole",
#       "iam:ListPolicyVersions",
#       "iam:DeletePolicy",
#       "iam:DetachRolePolicy",
#       "iam:ListRolePolicies",
#       "iam:GetRole",
#       "iam:GetPolicyVersion",
#       "iam:GetPolicy",
#       "iam:CreateRole",
#       "iam:CreatePolicy",
#       "iam:AttachRolePolicy",
#       "iam:TagRole",
#       "iam:TagPolicy",
#       "iam:PassRole",
#       "iam:CreateRole",
#       "iam:CreatePolicy",
#       "iam:AttachRolePolicy",
#       "logs:CreateLogGroup",
#       "ecs:CreateCluster",
#       "rds:CreateDBSubnetGroup"
#     ]
#     resources = ["*"]
#   }
# }

# resource "aws_iam_policy" "iam" {
#   name        = "${aws_iam_user.cd.name}-iam"
#   description = "Allow user to manage IAM resources."
#   policy      = data.aws_iam_policy_document.iam.json
# }

# resource "aws_iam_user_policy_attachment" "iam" {
#   user       = aws_iam_user.cd.name
#   policy_arn = aws_iam_policy.iam.arn
# }

# ################################
# # Policy for CloudWatch access #
# ################################

# data "aws_iam_policy_document" "logs" {
#   statement {
#     effect = "Allow"
#     actions = [
#       "logs:DeleteLogGroup",
#       "logs:DescribeLogGroups",
#       "logs:CreateLogGroup",
#       "logs:TagResource",
#       "logs:ListTagsLogGroup"
#     ]
#     resources = ["*"]
#   }
# }

# resource "aws_iam_policy" "logs" {
#   name        = "${aws_iam_user.cd.name}-logs"
#   description = "Allow user to manage CloudWatch resources."
#   policy      = data.aws_iam_policy_document.logs.json
# }

# resource "aws_iam_user_policy_attachment" "logs" {
#   user       = aws_iam_user.cd.name
#   policy_arn = aws_iam_policy.logs.arn
# }

# #########################
# # Policy for SSM access #
# #########################
# data "aws_iam_policy_document" "ssm" {
#   statement {
#     effect = "Allow"
#     actions = [
#           "ssmmessages:CreateControlChannel",
#           "ssmmessages:CreateDataChannel",
#           "ssmmessages:OpenControlChannel",
#           "ssmmessages:OpenDataChannel"
#         ]
#     resources = ["*"]
#   }
# }

# resource "aws_iam_policy" "ssm" {
#   name        = "${aws_iam_user.cd.name}-ssm"
#   description = "Allow user to manage SSM resources."
#   policy      = data.aws_iam_policy_document.ssm.json
# }
# resource "aws_iam_user_policy_attachment" "ssm" {
#   user       = aws_iam_user.cd.name
#   policy_arn = aws_iam_policy.ssm.arn
# }


# #########################
# # Policy for Task execution role#
# #########################
# data "aws_iam_policy_document" "task_execution_role" {
#   statement {
#     effect = "Allow"
#     actions = [
#       "ecr:GetAuthorizationToken",
#       "ecr:BatchCheckLayerAvailability",
#       "ecr:GetDownloadUrlForLayer",
#       "ecr:BatchGetImage",
#       "logs:CreateLogStream",
#       "logs:PutLogEvents"
#     ]
#     resources = ["*"]
#   }
# }

# resource "aws_iam_user_policy_attachment" "task_execution_role" {
#   user       = aws_iam_user.cd.name
#   policy_arn = data.aws_iam_policy.task_execution_role.arn
# }
# resource "aws_iam_policy" "task_execution_role" {
#   name        = "${aws_iam_user.cd.name}-task-execution-role"
#   description = "Allow user to manage ECS task execution role."
#   policy      = data.aws_iam_policy_document.task_execution_role.json
# }
# resource "aws_iam_user_policy_attachment" "task_execution_role" {
#   user       = aws_iam_user.cd.name
#   policy_arn = aws_iam_policy.task_execution_role.arn
# }
