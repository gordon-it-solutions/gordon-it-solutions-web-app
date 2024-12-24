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
  alias           = "keys"
  client_id       = data.azurerm_key_vault_secret.client_id.value
  client_secret   = data.azurerm_key_vault_secret.client_secret.value
  subscription_id = data.azurerm_key_vault_secret.subscription_id.value
  tenant_id       = data.azurerm_key_vault_secret.tenant_id.value
}

module "resource_group" {
  source   = "./modules/resource_group"
  name     = "gits-resources"
  location = "East US 2"
}

module "app_service_plan" {
  source              = "./modules/app_service_plan"
  name                = "gits-appserviceplan"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  sku_tier            = "Basic"
  sku_size            = "B1"
}

module "storage_account" {
  source              = "./modules/storage_account"
  name                = "gitsfrontendstorage"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  container_name      = "frontend"
  blob_name           = "frontend.zip"
}

module "app_service" {
  source              = "./modules/app_service"
  name                = "gits-frontend"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  app_service_plan_id = module.app_service_plan.id
  app_command_line    = "next start"
  app_settings = {
    WEBSITE_NODE_DEFAULT_VERSION = "14.17.0"
  }
}

