
# provider "aws" {
#   profile = "default"
#   region  = "us-east-1"
# }

# This example has a few pieces to go over. The initial resource for the aws_key_pair is required 
# for SSH connections. You must create a keypair locally to upload to AWS and the aws_key_pair resource 
# is the function for that. The aws_instance resource needs the key_name connected to it directly as an
# attribute. Within the aws_instance resource, we create a connection block which must define the connection
# type, the user, host, and private_key attributes.

resource "aws_key_pair" "example" {
  key_name = "examplekey"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  key_name = aws_key_pair.example.key_name
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Getting Started"
  }

 connection {
    type     = "ssh"
    user     = "root"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }

# The private_key attribute is necessary to successfully provision the host. 
# Once that connection is successful, the remote-exec provisioner will run on 
# the remote host to install, update, and start nginx in this example.

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} > ip_address.txt"
  }
}