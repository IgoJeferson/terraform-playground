# In production environments it is considered a best practice to store state elsewhere than 
# your local machine. The best way to do this is by running Terraform in a remote environment 
# with shared access to state

# Depending on the features you wish to use, Terraform has multiple remote backend options. 
# HashiCorp recommends using Terraform Cloud. Terraform Cloud offers free state management with 
# no limits on users, workspaces, locking, and HashiCorp Vault encryption. (https://www.terraform.io/docs/cloud/getting-started/index.html)

terraform {
  backend "remote" {
    organization = "icoelho-terraform-getting-started"

    workspaces {
      name = "terraform-playground"
    }
  }
}

# You'll also need a user token to authenticate with Terraform Cloud. You can generate one on the user settings page: https://app.terraform.io/app/settings/tokens

# Copy the user token to your clipboard, and create a Terraform CLI Configuration file. This file is This file is located at %APPDATA%\terraform.rc on Windows systems, and ~/.terraformrc on other systems.

# Paste the user token into that file like so:
# credentials "app.terraform.io" {
#   token = "REPLACE_ME"
# }

provider "aws" {
  profile    = "default"
  region     = "us-east-1"

  version   = 2.47
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5" # Ubuntu 16.10
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Getting Started"
  }
}


