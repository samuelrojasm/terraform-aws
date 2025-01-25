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
Terraform pedirá confirmación antes de aplicar los cambios. Confirmar escribiendo **`yes`**.
### 6. Gestionar el Estado con **`terraform state`**
- Terraform mantiene el estado de los recursos que gestiona en un archivo llamado **terraform.tfstate**. 
- Este archivo de estado almacena la configuración actual de la infraestructura. 
- No se debe modificar manualmente, pero puedes interactuar con él para realizar diversas acciones.
#### Algunos comandos útiles:
| Comando                                     | Descripción                                                 |
|---------------------------------------------|-------------------------------------------------------------|
| **`terraform show `**                       | Muestra el estado actual de la infraestructura.             |
| **`terraform state list`**                  | Muestra una lista de recursos en el estado actual.          |
| **`terraform state show <resource_name>`**  | Ver detalles de un recurso.                                 |

### 7. Modificar la Infraestructura
- Terraform se encargará de calcular las diferencias entre el estado actual y la configuración deseada, y hará los cambios necesarios en la infraestructura.
- Para hacer cambios en la infraestructura, simplemente editar el archivo **`.tf.`**  para agregar, modificar o eliminar recursos. Luego, sigur estos pasos:
    1. Previsualiza los cambios con **`terraform plan`**.
    2. Aplica los cambios con **`terraform apply`**.

### 8. Destruir la Infraestructura con **`terraform destroy`**
Para eliminar todos los recursos gestionados por Terraform (por ejemplo, en un entorno de prueba), se puede usar el siguiente comando:
```
terraform destroy
```
- Este comando eliminará todos los recursos definidos en los archivos **`.tf.`**  del proyecto y también actualizará el archivo de estado.
- Terraform pedirá confirmación antes de destruir los recursos. Confirmar escribiendo **`yesc.

### 9. Mantener la Infraestructura y el Estado
- Cuando se trabaja con Terraform en un equipo o en proyectos a gran escala, es importante mantener el archivo de estado (**`terraform.tfstate`**) en un almacenamiento remoto para que todos los miembros del equipo puedan acceder al mismo estado.
- Soluciones de almacenamiento remoto comunes:
    - Amazon S3 + DynamoDB (para bloqueo de estado) para AWS.
    - Azure Storage Account para Azure.
    - Google Cloud Storage para Google Cloud.
Para configurar el almacenamiento remoto, añadir un bloque **`backend`** en el archivo de configuración **`main.tf`**:
```
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "path/to/my/key"
    region = "us-west-2"
  }
}
```
### 10. Versionar Configuraciones con Git
- Es una buena práctica versionar los archivos de configuración de Terraform en un sistema de control de versiones como Git. 
- Esto permite que puedas realizar un seguimiento de los cambios a lo largo del tiempo y facilitar la colaboración en equipos.

## Comandos Básicos de Terraform:
| Comando                    | Descripción                                                 |
|----------------------------|-------------------------------------------------------------|
| **`terraform init`**       | Inicializa el proyecto y descarga los proveedores.          |
| **`terraform plan`**       | Muestra un plan de los cambios que se van a realizar.       |
| **`terraform apply`**      | Aplica los cambios a la infraestructura.                    |
| **`terraform show`**       | Muestra el estado actual de la infraestructura.             |
| **`terraform state list`** | Muestra una lista de recursos en el estado actual.          |
| **`terraform destroy`**    | Elimina todos los recursos gestionados por Terraform.       |

## Buenas Prácticas:
1. **Mantener los archivos de estado seguros**: Los archivos de estado (**`terraform.tfstate`**) contienen información sensible (como credenciales o configuraciones internas). Usa almacenamiento remoto y habilita el cifrado.
2. **Uso de módulos**: Organizar el código de infraestructura en módulos para reutilizar configuraciones y hacer el código más modular.
3. **Revisar siempre el **`plan`** antes de aplicar cambios**: Usar siempre **`terraform plan`** antes de **`terraform apply`** para evitar cambios no deseados.
4. **Automatización**: Integrar Terraform en un pipeline de CI/CD para automatizar la provisión de infraestructura.