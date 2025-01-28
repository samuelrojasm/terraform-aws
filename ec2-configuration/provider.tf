# Configuración del proveedor AWS
provider "aws" {
  region  = "us-east-1"             # Región de AWS donde se crean los recursos
  profile = "<nombre-del-perfil>"   # Nombre del perfil configurado en AWS CLI con IAM Identity Center
}

