
resource "aws_key_pair" "deployer" {
  key_name   = "star"
  public_key = file("~/.ssh/id_rsa.pub")

}
resource "aws_instance" "dove" {
  ami                    = var.ami
  instance_type          = "t2.medium"
  key_name               = aws_key_pair.deployer.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.master.id]
  depends_on             = [aws_security_group.master]

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  connection {
    type        = "ssh"
    user        = var.user
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

}