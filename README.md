# Terraform AWS Secure VPC

[![Terraform](https://img.shields.io/badge/Terraform-1.5+-blue?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)](https://aws.amazon.com/)

**Terraform module to provision a secure AWS Virtual Private Cloud (VPC)**
This repository implements a secure and reusable AWS VPC architecture with production‑ready patterns and security best practices.

## Table of Contents

1. [Overview](#1-overview)
2. [Features](#2-features)
3. [Architecture](#3-architecture)
4. [Prerequisites](#4-prerequisites)
5. [Usage](#5-usage)
6. [Simple deployment](#6-simple deployment)
7. [Inputs](#7-inputs)
8. [Outputs](#8-outputs)
9. [Security Considerations](#9-security-considerations)
10. [Best Practices](#10-best-practices)

---

## 1. Overview

This Terraform configuration provisions a secure AWS VPC with the following capabilities:

- Public and private subnets
- Internet Gateway for public subnets
- NAT Gateway for outbound internet from private subnets 
- Private S3 bucket with restricted public access
- IAM roles and policies following least‑privilege principles

The structure favors **clarity, modularity, and security** as core design principles.

---

---

## 3. Architecture

This module configures a standard AWS multi‑tier VPC:

- **Public Subnets** — reachable from the internet
- **Private Subnets** — no direct internet access
- **Routing** — NAT Gateway routes for egress traffic
- **Security** — IAM policies scoped to minimal required privileges

Typical high‑level architecture:

```
+-------------------------------------------+
|                       VPC (10.0.0.0/16)   |
|                                           |
|  Public Subnet  ---- Internet Gateway     |
|        |                                  |
|  Private Subnet -- NAT Gateway            |
|                                           |
|  IAM Roles      Private S3 Bucket         |
+-------------------------------------------+
```

---

## 4. Prerequisites

Before using this configuration, ensure:

- Terraform >= 1.5.x
- AWS Provider configured with credentials
- AWS CLI or IAM user/role with sufficient privileges

---

## 5. Usage

Refer to the minimal example below. Adjust CIDR blocks and AWS region for your environment.

```hcl
terraform {
  required_version = ">= 1.5"
}

provider "aws" {
  region = "eu-west-3"
}

  vpc_cidr = "10.0.0.0/16"

  public_subnets  = ["10.0.1.0/24"]
  private_subnets = ["10.0.2.0/24"]

  enable_nat_gateway = true

  tags = {
    Environment = "prod"
    Project     = "secure-vpc"
  }
}
```

---

## 6. Simple Deployment

```
terraform init
terraform plan
terraform apply
```

---

## 7. Inputs

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `vpc_cidr` | string | yes | Primary CIDR block of VPC |
| `public_subnets` | list(string) | yes | List of public subnet CIDRs |
| `private_subnets` | list(string) | yes | List of private subnet CIDRs |
| `enable_nat_gateway` | bool | no | Whether to create NAT Gateway |
| `tags` | map(string) | no | Tags for all resources |

---

## 8. Outputs

| Name | Description |
|------|-------------|
| `vpc_id` | ID of the created VPC |
| `public_subnets` | List of public subnet IDs |
| `private_subnets` | List of private subnet IDs |
| `nat_gateway_id` | NAT Gateway ID (if enabled) |

---

## 9. Security Considerations

- Use **least‑privilege IAM roles** for all resources
- Store Terraform state in an **encrypted remote backend**
- Enable **VPC flow logs** and guardrails where applicable
- Ensure S3 buckets have **server‑side encryption** and **access blocks**
- Avoid public access unless explicitly required
---

## 10. Best Practices

- Pin provider and module versions (`versions.tf`)
- Use separate workspaces or directories for environments
- Avoid storing AWS credentials in code
- Enable Terraform plan checks in CI/CD
- Version your Terraform code using Git tags


