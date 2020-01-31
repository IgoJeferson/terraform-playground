
# Perhaps an application we will run on our EC2 instance expects to use a specific Amazon S3 bucket, 
# but that dependency is configured inside the application code and thus not visible to Terraform. 
# In that case, we can use depends_on to explicitly declare the dependency

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# New resource for the S3 bucket our application will use.
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "terraform-getting-started-guide"
  acl    = "private"
}

# Change the aws_instance we declared earlier to now include "depends_on"
resource "aws_instance" "example" {
  ami           = "ami-b374d5a5" # Ubuntu 16.10
  instance_type = "t2.micro"

   tags = {
    Name = "Terraform HelloWorld"
  }

  # Tells Terraform that this EC2 instance must be created only after the
  # S3 bucket has been created.
  depends_on = [aws_s3_bucket.example]
}

# Terraform created the EC2 instance before creating the Elastic IP address. 
# Due to the interpolation expression that passes the ID of the EC2 instance to 
# the Elastic IP address, Terraform is able to infer a dependency, and knows it 
# must create the instance first.
resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}
