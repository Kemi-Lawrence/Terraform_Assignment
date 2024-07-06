variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "moso-interior-06"  # Change this to a unique bucket name
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
  default     = ""  # You can leave this empty for now
}


