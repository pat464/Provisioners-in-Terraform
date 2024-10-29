data "aws_ami" "Amazon_Linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "image-id"
    values = ["ami-06b21ccaeff8cd686"]
  }
}