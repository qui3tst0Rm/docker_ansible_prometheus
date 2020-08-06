resource "aws_instance" "ec2_instance" {
  ami                    = var.ec2-instance-ami
  instance_type          = var.task-instance-type
  key_name               = var.key_name
  count                  = length(var.instance_names)
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = local.sg1

  tags = {
    Name = var.instance_names[count.index]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y git"
      "sudo yum install -y python3",
      "alternatives --set python /usr/bin/python3",
      "sudo yum install epel-release -y",
      "sudo yum instal -y ansible",
      "cd /etc/ansible",
      "git clone https://github.com/qui3tst0Rm/docker_ansible_prometheus.git",
      "cd docker_ansible_prometheus/playbooks",
    ]
  }
}