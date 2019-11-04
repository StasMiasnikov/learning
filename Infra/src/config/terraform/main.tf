provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "c:\\creds"
  profile = "learning"
}
//---S3
resource "aws_s3_bucket" "b" {
  bucket = "stas-learning-test-bucket"
  acl = "private"

  tags = {
    Name = "My bucket"
    Environment = "Dev"
  }
}



//---EC2 for infra
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name = "${var.key_name}"
  public_key = "${tls_private_key.example.public_key_openssh}"
}

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
resource "aws_security_group" "example" {
  name = "${var.instance_name}"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = "${var.ssh_port}"
    to_port = "${var.ssh_port}"
    protocol = "tcp"

    # To keep this example simple, we allow incoming SSH requests from any IP. In real-world usage, you should only
    # allow SSH requests from trusted servers, such as a bastion host or VPN server.
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "Infra"
  }

  provisioner "remote-exec" {
    inline = [
      "echo The server's IP address is ${self.private_ip}",
      "sudo yum update -y",
      "sudo amazon-linux-extras install docker",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user"

    ]
  }

}


output "public_instance_id" {
  value = "${aws_instance.web.id}"
}

output "public_instance_ip" {
  value = "${aws_instance.web.public_ip}"
}


