# Terraform para AWS
- Terraform es una herramienta de Infraestructura como Código (IaC) que permite definir, gestionar y automatizar la infraestructura a través de archivos de configuración declarativa. 
- Terraform utiliza un lenguaje llamado HCL (HashiCorp Configuration Language) para definir la infraestructura.

## Pasos Básicos de Terraform
Pasos básicos para usar Terraform de manera eficiente en cualquier proyecto.
### 1. Instalar Terraform
Instalación en macOS:
```
brew install terraform
```
Una vez instalado, puedes verificar la instalación ejecutando:
```
terraform -v
```
### 2. Inicializar el Directorio del Proyecto
Antes de trabajar con Terraform, se debe crear un directorio donde se guarden los archivos de configuración de **Terraform** y luego inicializarlo.
- Crea un nuevo directorio en la máquina local para tu proyecto de Terraform.
```
mkdir my-terraform-project
cd my-terraform-project
```
- Inicializa Terraform:
Esto descarga los proveedores necesarios y prepara el entorno de trabajo.
```
terraform init
```
### 3. Escribir Archivos de Configuración
- Terraform utiliza archivos de configuración escritos en **HCL (HashiCorp Configuration Language)**. 
- Estos archivos definen la infraestructura que se deseas crear o gestionar.
- Un archivo básico de configuración en Terraform tiene la extensión **`.tf.`** 
- Ejemplo básico de un archivo de configuración **`main.tf`** (crear una instancia EC2 en AWS):
    - Este archivo declara lo siguiente:
        - **Proveedor**: AWS (con la región **us-west-2**).
        - **Recurso**: Una instancia EC2 con tipo **t2.micro** y una imagen de Amazon Machine Image (AMI).
```
provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # AMI de ejemplo
  instance_type = "t2.micro"

  tags = {
    Name = "MyInstance"
  }
}
```
### 4. Previsualizar los Cambios con **`terraform plan`**
- Antes de aplicar los cambios a la infraestructura real, es importante hacer una previsualización de los cambios que Terraform realizará.
- Este comando muestra lo que Terraform hará (crear, modificar, eliminar recursos) sin aplicar realmente los cambios. 
- Es una revisión de seguridad para asegurarte de que lo que vas a crear o modificar es correcto.
```
terraform plan
```
### 5. Aplicar la Configuración con **`terraform apply`**
Si el plan es correcto y quieres aplicar los cambios, se ejecuta:
```
terraform apply
```
Terraform pedirá confirmación antes de aplicar los cambios. Se confirma escribiendo **`yes`**.
### 6. Gestionar el Estado con **`terraform state`**
- Terraform mantiene el estado de los recursos que gestiona en un archivo llamado **terraform.tfstate**. 
- Este archivo de estado almacena la configuración actual de la infraestructura. 
- No se debe modificar manualmente, pero puedes interactuar con él para realizar diversas acciones.
#### Algunos comandos útiles:
| Comando                    | Descripción                                                                  |
|---------------------------------------------|-------------------------------------------------------------|
| **`terraform show `**                       | Muestra el estado actual de la infraestructura.             |
| **`terraform state list`**                  | Muestra una lista de recursos en el estado actual.          |
| **`terraform state show <resource_name>`**  | Ver detalles de un recurso.                                 |











## Comandos Básicos de Terraform:
| Comando                    | Descripción                                                 |
|----------------------------|-------------------------------------------------------------|
| **`terraform init`**       | Inicializa el proyecto y descarga los proveedores.          |
| **`terraform plan`**       | Muestra un plan de los cambios que se van a realizar.       |
| **`terraform apply`**      | Aplica los cambios a la infraestructura.                    |
| **`terraform show**`**     | Muestra el estado actual de la infraestructura.             |
| **`terraform state list`** | Muestra una lista de recursos en el estado actual.          |
| **`terraform destroy`**    | Elimina todos los recursos gestionados por Terraform.       |


