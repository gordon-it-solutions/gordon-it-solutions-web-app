variable "name" {
  description = "The name of the App Service plan"
  type        = string
}

variable "location" {
  description = "The location of the App Service plan"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier of the App Service plan"
  type        = string
}

variable "sku_size" {
  description = "The SKU size of the App Service plan"
  type        = string
}
