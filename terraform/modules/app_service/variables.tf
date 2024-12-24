variable "name" {
  description = "The name of the App Service"
  type        = string
}

variable "location" {
  description = "The location of the App Service"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service plan"
  type        = string
}

variable "app_command_line" {
  description = "The command line to start the app"
  type        = string
}

variable "app_settings" {
  description = "The app settings for the App Service"
  type        = map(string)
}
