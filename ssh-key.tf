# ssh-key.tf

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
}

output "ssh_private_key" {
  value       = tls_private_key.my_key.private_key_pem
  sensitive   = true
  description = "SSH private key for EC2 instances"
}

