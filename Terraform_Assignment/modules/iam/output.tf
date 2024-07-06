output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.moso_interior_role.arn
}