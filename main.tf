terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_key_vault" "gits" {
  name                = "GordonITSolutionsKV"
  resource_group_name = "GordonITSolutionsRG"
}

data "azurerm_key_vault_secret" "client_id" {
  name         = "AZURE-CLIENT-ID"
  key_vault_id = data.azurerm_key_vault.gits.id
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = "AZURE-CLIENT-SECRET"
  key_vault_id = data.azurerm_key_vault.gits.id
}

data "azurerm_key_vault_secret" "subscription_id" {
  name         = "AZURE-SUBSCRIPTION-ID"
  key_vault_id = data.azurerm_key_vault.gits.id
}

data "azurerm_key_vault_secret" "tenant_id" {
  name         = "AZURE-TENANT-ID"
  key_vault_id = data.azurerm_key_vault.gits.id
}

provider "azurerm" {
  features {}
  alias = "keys"
  client_id       = data.azurerm_key_vault_secret.client_id.value
  client_secret   = data.azurerm_key_vault_secret.client_secret.value
  subscription_id = data.azurerm_key_vault_secret.subscription_id.value
  tenant_id       = data.azurerm_key_vault_secret.tenant_id.value
}

resource "azurerm_resource_group" "gits" {
  name     = "gits-resources"
  location = "East US 2"
}

resource "azurerm_app_service_plan" "gits" {
  name                = "gits-appserviceplan"
  location            = azurerm_resource_group.gits.location
  resource_group_name = azurerm_resource_group.gits.name
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "gits" {
  name                = "gits-appservice"
  location            = azurerm_resource_group.gits.location
  resource_group_name = azurerm_resource_group.gits.name
  app_service_plan_id = azurerm_app_service_plan.gits.id
}


