#Security Group for SSH access using provisioners remote exec
resource "aws_security_group" "instance" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #Allow all ssh connections for testing. For production environment, use specific IPs.
  }
}