# Instance public ip
output "server_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}