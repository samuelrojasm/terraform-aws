# Output de la IP pública de la instancia EC2
output "instance_public_ip" {
  value       = aws_instance.my_ec2.public_ip
  description = "La dirección IP pública de la instancia EC2."
}

output "instance_ip_addr" {
  value = { for service, i in aws_instance.my_ec2 : service => i.private_ip }
}
