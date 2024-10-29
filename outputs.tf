#Public IP
output "public_ip" {
  description = "public ip of the ec2 instance"
  value       = aws_instance.testami.public_ip
}
#key pair
output "public_key" {
  description = "pulic ssh key"
  value       = aws_key_pair.gen_key.id
  sensitive   = true
}
#private key
output "private_key" {
  description = "private ssh key"
  value       = tls_private_key.SSHKey.id
  sensitive   = true
}
#keyname
output "key_name" {
  value = aws_instance.testami.key_name
}
#key pair name
output "key_pair_name" {
  value = aws_key_pair.gen_key.key_name
}
#pem key
output "private_key_pem" {
  value     = tls_private_key.SSHKey.private_key_pem
  sensitive = true
}