# Instance public ip
output "ansible_public_ip" {
    value = {
        for instance in aws_instance.ec2_instance:
        instance.tags.Name => instance.public_ip
    }
}

# Instance private ip
output "ansible_private_ip" {
    value = {
        for instance in aws_instance.ec2_instance:
        instance.tags.Name => instance.private_ip
    }
}

