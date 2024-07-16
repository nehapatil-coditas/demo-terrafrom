# This is a demo project for github actions and terraform integration.

# Added two workflows
# 1. Terraform Apply
# 2. Terraform Destroy

terraform {
 required_providers {
   aws = {
      source = "hashicorp/aws"
      version = "2.43.0"
    }
 }
 
 #Adding a backend
 backend "s3" {
   bucket  = "terraform-state-bucket-101"
   region = "us-east-1"
   key    = "terraform.tfstate"
   encrypt = true
 }
}
 
# Adding provider
provider "aws" {
 region = "us-east-1"
}
 
# Creating a Amazon Linux 2 VM
resource "aws_instance" "test_instance" {
 ami           = "ami-01fccab91b456acc2"
 instance_type = "t2.nano"
 tags = {
   Name = "new_instance"
 }
}

