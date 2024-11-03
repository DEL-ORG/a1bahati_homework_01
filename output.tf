output "instance_id" {
  value = aws_instance.homework_01.id
}

output "instance_public_ip" {
  value = aws_instance.homework_01.public_ip
}

output "instance_public_dns" {
  value = aws_instance.homework_01.public_dns
}
