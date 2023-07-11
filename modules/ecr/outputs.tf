output "ecr_arn" {
  description = "ARN of ECR Repository"
  value       = aws_ecr_repository.ecr.arn
}
