# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "key_name" {
  description = "The EC2 Key Pair to associate with the EC2 Instance for SSH access."
  default = "InfraInstanceKey"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to deploy into"
  default = "us-east-1"
}

variable "instance_name" {
  description = "The Name tag to set for the EC2 Instance."
  default = "terratest-example"
}

variable "ssh_port" {
  description = "The port the EC2 Instance should listen on for SSH requests."
  default = 22
}

variable "ssh_user" {
  description = "SSH user name to use for remote exec connections,"
  default = "ubuntu"
}
variable "ami_id"{
  default = "ami-077e31c4939f6a2f3"
}