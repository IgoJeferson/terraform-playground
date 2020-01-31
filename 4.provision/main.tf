# If you're using an image-based infrastructure (perhaps with images created with Packer), 
# then what you've learned so far is good enough. But if you need to do some initial setup on 
# your instances, then provisioners let you upload files, run shell scripts, or install and 
# trigger other software like configuration management tools, etc.

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

# The local-exec provisioner executes a command locally on the machine running Terraform.
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

# To see more information about provisioners -> https://www.terraform.io/docs/provisioners/