## Windows Users
https://www.youtube.com/watch?v=J0y2tjBz2Ao
## Crear entorno virtual
python -m venv dev-api-take-one 
## Activar
dev-api-take-one\Scripts\activate
## to deactivate
        deactivate
## Modules install
pip install fastapi
pip install uvicorn

##
crear main.py meter codigo

## Levantar el server 
## nombre del archivo : nombre de la app --reload queda el server up escuchando
uvicorn main:app --reload


TODO:
## luego ver de hacer el schema post para una segunda api


###### Añadido dockerfile y docker compose | july 8 8:28pm
creada la imagen de docker
tests OK 

TODO: 
## COnectar api con db



## Docker
docker login --username 15821661
docker images
## Docker Hub necesitamos que nuestra imagen se llame nombre_de_usuario/nombre_del_repositorio:etiqueta.
tag image-test-fastapi 15821661/image-test-fastapi:v1
docker push 15821661/image-test-fastapi:v1

SHits: update the cli az 
Loguear a azure


issue con esto:
resource "azurerm_resource_group" "example" {
    id       = "/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-2857c6cb-playground-sandbox"
    location = "eastus"
    name     = "1-2857c6cb-playground-sandbox"
    tags     = {}
}



## to be used in cloudguru sandboxes [Azure]
The main.tf need to be fixed.

did not create new RG
so need to import that block:
    terraform init
    terraform import azurerm_resource_group.example /subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-2857c6cb-playground-sandbox
    terraform show


