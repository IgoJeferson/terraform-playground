
# The profile attribute here refers to the AWS Config File in ~/.aws/credentials on MacOS and 
# Linux or %UserProfile%\.aws\credentials on a Windows system. It is HashiCorp recommended practice 
# that credentials never be hardcoded into *.tf configuration files. We are explicitly defining 
# the default AWS config profile here to illustrate how Terraform accesses sensitive credentials.

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# Example hardcoded (not recommeded)
# provider "aws" {
#     access_key = "ACCESS_KEY"
#     secret_key = "SECRET_KEY"
#     region     = "us-east-1"
# }

resource "aws_instance" "example" {
  # ami           = "ami-2757f631" # Ubuntu 16.04
  ami           = "ami-b374d5a5" # Ubuntu 16.10
  instance_type = "t2.micro"

   tags = {
    Name = "Terraform Getting Started"
  }
}
