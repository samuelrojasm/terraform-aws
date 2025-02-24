locals {
  extra_tag = "extra-tag"
}

# Crear una instancia EC2
resource "aws_instance" "my_ec2" {
  ami           = "ami-0ac4dfaf1c5c0cce" # Amazon Linux 2023 64-bit(x86) en us-east-01
  instance_type = "t2.micro"

  # Etiquetas para identificar la instancia
  tags = {
    Name     = "MyEC2Instance"
    ExtraTag = local.extra_tag
  }
}

# Crear instancias de una lista
resource "aws_instance" "example" {
  for_each = var.service_names

  # Amazon Linux 2023 64-bit(x86) en us-east-01
  ami           = "ami-0ac4dfaf1c5c0cce"
  instance_type = "t2.micro"

  # Etiquetas para identificar la instancia
  tags = {
    Name     = "EC2-${each.key}"
    ExtraTag = local.extra_tag
  }
}