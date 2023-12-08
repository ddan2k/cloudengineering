resource "tls_private_key" "client_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "client_key" {
    key_name = "client_key"
    public_key = tls_private_key.client_key.public_key_openssh
}