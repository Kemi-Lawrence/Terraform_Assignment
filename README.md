# Terraform Configuration for Deploying a Static Website

This Terraform configuration deploys a static website using AWS services including S3, CloudFront, Route 53, IAM roles and policies, API Gateway, and SSL certificates.

## Prerequisites
- AWS account credentials with appropriate permissions.
- Terraform installed locally.

## Steps to Deploy

### Step 1: Initialize Terraform

Initialize Terraform in your project directory:

```bash
terraform init


### Step 2: Configure AWS Provider

Update provider.tf with your AWS credentials:

hcl

provider "aws" {
  region = "eu-west-2"
}

Step 3: Configure S3 Bucket for Website Hosting

Create s3_website.tf with the following configuration:

hcl

resource "aws_s3_bucket" "website" {
  bucket = "moso-interior"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

Step 4: Configure CloudFront Distribution

Create cloudfront.tf with the CloudFront distribution configuration:

hcl

resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = aws_s3_bucket.website.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.website.bucket_regional_domain_name

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  default_root_object = "index.html"

  # Add more configuration options as needed
}

Step 5: Configure Route 53 DNS

Create route53.tf to manage DNS records:

hcl

resource "aws_route53_zone" "zone" {
  name = "moso-interior.com"
}

resource "aws_route53_record" "website_record" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = "www.moso-interior.com"
  type    = "A"
  alias {
    name    = aws_cloudfront_distribution.distribution.domain_name
    zone_id = aws_cloudfront_distribution.distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

Step 6: Configure IAM Roles and Policies

Create iam.tf to define IAM roles and policies:

hcl

data "aws_iam_policy_document" "s3_policy" {
  # Define IAM policy for S3 access
}

resource "aws_iam_role" "website_role" {
  # Define IAM role for website deployment
}

resource "aws_iam_role_policy_attachment" "website_policy_attachment" {
  # Attach policies to IAM role
}

Step 7: Deploy API Gateway and SSL Certificates (if applicable)

In cases where your static website requires API Gateway or SSL certificates, configure them in respective .tf files.
Deployment

Apply the Terraform configuration to deploy your static website:

bash

terraform apply

## Cleanup

To destroy the infrastructure created by Terraform, run:

bash

terraform destroy