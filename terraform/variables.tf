variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service plan"
  type        = string
}

variable "app_service_plan_sku" {
  description = "The SKU of the App Service plan"
  type        = map(string)
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
}

variable "blob_name" {
  description = "The name of the storage blob"
  type        = string
}

variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}
