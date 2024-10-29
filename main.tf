resource "aws_instance" "local" {
  ami           = data.aws_ami.Amazon_Linux.id
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo EC2 instance ${aws_instance.local.id} has been created!"
  }
}