terraform {
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }
  backend "remote" {
    organization = "tf-cloud-rpe"

    workspaces {
      name = "test-tfc"
    }
  }
}
provider "azurerm" {
  features {}
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
  }

data "azurerm_resource_group" "rg" {
  name = "ramon-pizana"
}

resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}
