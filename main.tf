resource "" "docker_instance" {
    ami = var.task-ami
    instance_type = var.task-instance-type
    key_name = var.key_name
    count = length(var.instance_names)
    subnet_id = aws_subnet.public_1.id
    vpc_security_group_ids = aws_security_group.group_1.id

    tags = {
        Name = var.instance_names[count.index]
    }

    /*connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file(var.private_key)
        host = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [

        ]
    
    }*/

}