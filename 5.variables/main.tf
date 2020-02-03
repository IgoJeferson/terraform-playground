
# This uses more interpolations, this time prefixed with var.. 
# This tells Terraform that you're accessing variables. This configures the AWS provider 
# with the given variables.

provider "aws" {
  profile = "default"
  region  = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5" 
  instance_type = "t2.micro"

   tags = {
    Name = "Terraform Getting Started"
  }
}
