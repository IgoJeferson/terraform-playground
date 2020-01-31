resource "aws_key_pair" "example" {
  key_name = "examplekey"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  key_name = aws_key_pair.example.key_name
  # ...

 connection {
    type     = "ssh"
    user     = "root"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
}