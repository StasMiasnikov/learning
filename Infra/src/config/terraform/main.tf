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

# data "aws_ami" "ubuntu" {
#   most_recent = true


#   filter {
#     name = "name"
#     values = [
#       "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
#   }

#   filter {
#     name = "virtualization-type"
#     values = [
#       "hvm"]
#   }

#   owners = [
#     "099720109477"]
#   # Canonical
# }
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
  ami = "${var.ami_id}"
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
  ami = "${var.ami_id}"
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
  ami = "${var.ami_id}"
  # ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name = "back_office_generated"
  security_groups = [ "launch-wizard-1" ]
  tags = {

    Name = "control"
  }

  provisioner "local-exec" {
    working_dir = "/home/vagrant/shared/GIt/learning/Infra/src/config/Ansible"
    command  = "ansible-playbook -i inventories/default/main.yml k8s.yml"
    environment = {
      control_ec2_ip = "${self.public_ip}"
      control_ec2_public_hostname = "${self.public_dns}"
    }
  }

}


    #     ansible_host: "{{ control_ec2_ip }}"
    #     public_hostname: "{{ control_ec2_public_hostname }}"
    # worker-1:
    #     ansible_host: "{{ worker-1_ec2_ip }}"
    #     public_hostname: "{{ worker-1_ec2_public_hostname }}"
    # worker-2:
    #     ansible_host: "{{ worker-2_ec2_ip }}"
    #     public_hostname: "{{ worker-2_ec2_public_hostname }}"