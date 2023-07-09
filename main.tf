provider "azurerm" {
  skip_provider_registration = true
  features {}
}

variable "azure_portal_url" {
  description = "Azure portal URL"
  type        = string
  default     = "https://portal.azure.com/#@realhandsonlabs.com/resource/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-2857c6cb-playground-sandbox/overview"
}

variable "azure_user" {
  description = "Azure username"
  type        = string
  default     = "cloud_user_p_82293fb2@realhandsonlabs.com"
}

variable "azure_password" {
  description = "Azure password"
  type        = string
  default     = "7Be4&3EVDQ5KqnWYKkif"
}
### CREA EL RESOURCE GROUP , pero como es un lab no la da 
#resource "azurerm_resource_group" "example" {
#  name     = "dev-dummy-apis"
#  location = "eastus"
#}

### para usar un RG existente
resource "azurerm_resource_group" "example" {
  name     = "1-2857c6cb-playground-sandbox"
  location = "eastus"
}


resource "azurerm_container_registry" "example" {
  name                     = "examplecontainerregistryjorgejuly2023" #name changed
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  sku                      = "Basic"
  admin_enabled            = true
}

resource "azurerm_container_group" "example" {
  name                = "examplecontainergroupjorgejuly2023"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  ip_address_type     = "Public"
  dns_name_label      = "examplecontainergroupdns"

  os_type = "Linux"  # Specify the operating system type here

  # Access the deployed container through the Azure portal: ${var.azure_portal_url}
  container {
    name   = "fastapi-container"
    image  = "docker.io/15821661/image-test-fastapi:v1"
    cpu    = "1"
    memory = "1.5"

    environment_variables = {
      AZURE_USER     = var.azure_user
      AZURE_PASSWORD = var.azure_password
    }

    ports {
      port     = 8000
      protocol = "TCP"
    }
  }
}
