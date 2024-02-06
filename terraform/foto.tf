resource "snowflake_storage_integration" "azure_foto_integration" {
  name    = var.foto_azure_int
  type    = "EXTERNAL_STAGE"
  enabled = true
  storage_allowed_locations = [var.azure_foto_url_storage_allowed_locations]
  storage_provider         = "AZURE"
  azure_tenant_id     = var.azure_tenant
}