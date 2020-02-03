
provider "aws" {
  profile   = "default"
  region    = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5" 
  instance_type = "t2.micro"

   tags = {
    Name = "Terraform Getting Started"
  }
}


# This defines an output variable named "ip". 
# The name of the variable must conform to Terraform variable naming conventions 
# if it is to be used as an input to other modules. The value field specifies what 
# the value will be, and almost always contains one or more interpolations, since the 
# output data is typically dynamic. In this case, we're outputting the public_ip attribute
# of the elastic IP address.

# Multiple output blocks can be defined to specify multiple output variables.

output "ip" {
  value = aws_instance.example.public_ip
}