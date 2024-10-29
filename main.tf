#Instance
resource "aws_instance" "testami" {
  ami                    = data.aws_ami.Amazon_Linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name               = aws_key_pair.gen_key.key_name
  provisioner "remote-exec" { #Remote-exec
    inline = [
      "echo 'Congratulations!'"
    ]
    on_failure = continue
  }
  connection { #Connect to ec2 instance public IP using ssh with "ec2-user" as the username
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = tls_private_key.SSHKey.private_key_pem
    timeout     = "4m"
  }
  tags = {
    Name = "testami"
  }
}
#private key
resource "tls_private_key" "SSHKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
#Public key - upload public key to AWS 
resource "aws_key_pair" "gen_key" {
  key_name   = "SSHKey"
  public_key = tls_private_key.SSHKey.public_key_openssh
}
#Save key locally
#resource "local_file" "private_key" {
# content         = tls_private_key.SSHKey.private_key_pem
#  filename        = "private_key.pem"
#  file_permission = "0400"
#}
