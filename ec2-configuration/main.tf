# Crear una instancia EC2
resource "aws_instance" "my_ec2" {
  ami           = "ami-0ac4dfaf1c5c0cce"   # Amazon Linux 2023 64-bit(x86) en us-east-01
  instance_type = "t2.micro"               # Tipo de instancia
  
  # Etiquetas para identificar la instancia
  tags = {
    Name = "MyEC2Instance"
  }
}  