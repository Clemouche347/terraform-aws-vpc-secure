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

Private subnets have outbound internet access through a NAT Gateway while remaining unreachable from the public Internet.
