provider "aws" {
  region = "us-east-2"
  profile = "default"
  shared_credentials_file  = "/home/vagrant/.aws/credentials"
}
//---S3
# resource "aws_s3_bucket" "b" {
#   bucket = "stas-learning-test-bucket"
#   acl = "private"

#   tags = {
#     Name = "My bucket"
#     Environment = "Dev"
#   }
# }



//---EC2 for infra
# resource "tls_private_key" "example" {
#   algorithm = "RSA"
#   rsa_bits = 4096
# }

# resource "aws_key_pair" "generated_key" {
#   key_name = "${var.key_name}"
#   public_key = "${tls_private_key.example.public_key_openssh}"
# }

data "aws_ami" "ubuntu" {
  most_recent = true


  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = [
      "hvm"]
  }

  owners = [
    "099720109477"]
  # Canonical
}
# resource "aws_security_group" "example" {
#   name = "${var.instance_name}"

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = [
#       "0.0.0.0/0"]
#   }

#   ingress {
#     from_port = "${var.ssh_port}"
#     to_port = "${var.ssh_port}"
#     protocol = "tcp"

#     # To keep this example simple, we allow incoming SSH requests from any IP. In real-world usage, you should only
#     # allow SSH requests from trusted servers, such as a bastion host or VPN server.
#     cidr_blocks = [
#       "0.0.0.0/0"]
#   }
# }

resource "aws_instance" "worker-1" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
 
  tags = {
    Name = "worker-1"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "echo The server's IP address is ${self.private_ip}",
  #     "sudo yum update -y",
  #     "sudo amazon-linux-extras install docker",
  #     "sudo service docker start",
  #     "sudo usermod -a -G docker ec2-user"

  #   ]
  # }

}

resource "aws_instance" "worker-2" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "worker-2"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "echo The server's IP address is ${self.private_ip}",
  #     "sudo yum update -y",
  #     "sudo amazon-linux-extras install docker",
  #     "sudo service docker start",
  #     "sudo usermod -a -G docker ec2-user"

  #   ]
  # }

}

resource "aws_instance" "control" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name = "back_office_generated"
  tags = {
    Name = "control"
  }

  provisioner "remote-exec" {
    inline = [
      "echo The server's IP address is ${self.private_ip}",
      "whoami"

    ]
  }

  # provisioner "local-exec" {
  #   command  = "cd ../Ansible && ansible-playbook -e='control_ec2_ip=${self.public_ip}' -i inventories/default/main.yml k8s.yml "
  # }

}
