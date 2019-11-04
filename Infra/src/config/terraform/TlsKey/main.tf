terraform {
  required_version = ">= 0.12.0"
}

locals {
  public_key_filename = "${var.path}/${var.name}.pub"
  private_key_filename = "${var.path}/${var.name}.pem"
}

resource "tls_private_key" "generated" {
  algorithm = "RSA"
}

resource "aws_key_pair" "generated" {
  key_name = "${var.name}"
  public_key = tls_private_key.generated.public_key_openssh

  lifecycle {
    ignore_changes = "${var.name}"
  }
}

resource "local_file" "public_key_openssh" {
  content = tls_private_key.generated.public_key_openssh
  filename = local.public_key_filename
}

resource "local_file" "private_key_pem" {
  content = tls_private_key.generated.private_key_pem
  filename = local.private_key_filename
}

output "key_name" {
  value = aws_key_pair.generated.key_name
}

output "public_key_openssh" {
  value = tls_private_key.generated.public_key_openssh
}

output "private_key_pem" {
  value = tls_private_key.generated.private_key_pem
}

output "public_key_filepath" {
  value = local.public_key_filename
}

output "private_key_filepath" {
  value = local.private_key_filename
}


variable "name" {
  description = "Unique name for the key, should also be a valid filename. This will prefix the public/private key."
  default = "testKey"
}

variable "path" {
  description = "Path to a directory where the public and private key will be stored."
  default = ""
}

