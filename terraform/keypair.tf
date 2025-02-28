resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "dp_key" {
  key_name   = "tf-key"
  public_key = tls_private_key.generated_key.public_key_openssh
}

# Save private key to a local file
resource "local_file" "private_key" {
  content  = tls_private_key.generated_key.private_key_pem
  filename = "generated-key.pem"
}