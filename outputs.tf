output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}


output "s3_bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}

output "iam_policy_arn" {
  value = aws_iam_policy.s3_read_only.arn
}
