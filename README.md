# Terraform AWS Secure VPC

This repository demonstrates a secure AWS VPC architecture using Terraform.
It focuses on clean project structure, explicit variables, and reusable patterns.

## Current scope
- VPC
- Public subnet
- Private subnet
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Route Table
- Private S3 bucket

Private subnets have outbound internet access through a NAT Gateway while remaining unreachable from the public Internet.

## Private S3 bucket contruction
resources added
- `aws_s3_bucket`
- `aws_s3_bucket_public_access_block`
- `aws_s3-bucket_versioning`
- `aws_s3_bucket_server_side_encryption_configuration` (AES256)
- lifecycle `prevent_destroy = true`
