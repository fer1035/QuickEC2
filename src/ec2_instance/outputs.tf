output "private_dns" {
  value       = aws_instance.instance.private_dns
  description = "Private DNS address of the instance."
}

output "public_dns" {
  value       = aws_instance.instance.public_dns
  description = "Public DNS address of the instance."
}

output "public_ip" {
  value       = aws_instance.instance.public_ip
  description = "Public IP address of the instance."
}

output "instance_arn" {
  value       = aws_instance.instance.arn
  description = "ARN of the instance."
}
