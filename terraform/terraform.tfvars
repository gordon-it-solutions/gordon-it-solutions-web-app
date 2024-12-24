resource_group_name   = "gits-resources"
location              = "East US 2"
app_service_plan_name = "gits-appserviceplan"
app_service_plan_sku = {
  tier = "Basic"
  size = "B1"
}
storage_account_name = "gitsfrontendstorage"
container_name       = "frontend"
blob_name            = "frontend.zip"
app_service_name     = "gits-frontend"
