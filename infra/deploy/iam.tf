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
#       "iam:CreateUser",
#       "iam:AttachUserPolicy",
#       "iam:PutUserPolicy",
#       "iam:CreateAccessKey"
#     ]
#     resources = ["arn:aws:iam::*:user/${var.project_name}-cd"]
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

# #########################################################
# # Policy for Terraform backend to S3 and DynamoDB access #
# #########################################################

# data "aws_iam_policy_document" "tf_backend" {
#   statement {
#     effect    = "Allow"
#     actions   = ["s3:ListBucket", "s3:GetObject"]
             
#     resources = ["arn:aws:s3:::${var.bucket_name}"]
#   }

#   statement {
#     effect  = "Allow"
#     actions = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
#     resources = [

#       "arn:aws:s3:::${var.bucket_name}/tf-state-deploy/*",
#       "arn:aws:s3:::${var.bucket_name}/tf-state-deploy-env/*"
#     ]


#   statement {
#     effect = "Allow"
#     actions = [
#       "kms:Decrypt",
#       "kms:Encrypt",
#       "kms:GenerateDataKey",
#       "kms:DescribeKey"
#     ]
#     resources = ["arn:aws:kms:*:*:key/${var.kms_key_id}"]
#   }

#   statement {
#     effect = "Allow"
#     actions = [
#       "dynamodb:DescribeTable",
#       "dynamodb:GetItem",
#       "dynamodb:PutItem",
#       "dynamodb:DeleteItem"
#     ]
#     resources = ["arn:aws:dynamodb:*:*:table/${var.dynamodb_table_name}"]
#   }
# }

# resource "aws_iam_policy" "tf_backend" {
#   name        = "${aws_iam_user.cd.name}-tf-s3-dynamodb"
#   description = "Allow user to use S3 and DynamoDB for TF backend resources"
#   policy      = data.aws_iam_policy_document.tf_backend.json
# }

# resource "aws_iam_user_policy_attachment" "tf_backend" {
#   user       = aws_iam_user.cd.name
#   policy_arn = aws_iam_policy.tf_backend.arn
# }

# #########################
# # Policy for ECR access #
# #########################

# data "aws_iam_policy_document" "ecr" {
#   statement {
#     effect    = "Allow"
#     actions   = ["ecr:GetAuthorizationToken"]
#     resources = ["*"]
#   }

#   statement {
#     effect = "Allow"
#     actions = [
#       "ecr:CreateRepository", # Allow repository creation
#       "ecr:CompleteLayerUpload",
#       "ecr:UploadLayerPart",
#       "ecr:InitiateLayerUpload",
#       "ecr:BatchCheckLayerAvailability",
#       "ecr:PutImage"
#     ]
#     resources = [
#       "arn:aws:ecr:*:*:*", # Account-level ARN for CreateRepository
#       "arn:aws:ecr:*:*:repository/*"
#     ]
#   }

#   statement {
#     effect = "Allow"
#     actions = [
#       "ecr:DeleteRepository",
#       "ecr:DescribeRepositories",
#       "ecr:ListTagsForResource",
#       "ecr:TagResource",
#       "ecr:UntagResource"
#     ]
#     resources = ["arn:aws:ecr:*:*:repository/*"]
#   }
# }

# resource "aws_iam_policy" "ecr" {
#   name        = "${aws_iam_user.cd.name}-ecr"
#   description = "Allow user to manage ECR resources"
#   policy      = data.aws_iam_policy_document.ecr.json
# }

# resource "aws_iam_user_policy_attachment" "ecr" {
#   user       = aws_iam_user.cd.name
#   policy_arn = aws_iam_policy.ecr.arn
# }

