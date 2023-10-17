# resource "azurerm_data_factory" "adf_dev" {
#   name                = "Ivy-adf-dev"
#   location            = data.azurerm_resource_group.imported_rg_dev.location
#   resource_group_name = data.azurerm_resource_group.imported_rg_dev.name

#     identity {
#     type = "SystemAssigned"
#   }  
# }

resource "azurerm_data_factory" "adf_main" {
  name                = "Ivy-adf-main"
  location            = data.azurerm_resource_group.imported_rg_dev.location
  resource_group_name = data.azurerm_resource_group.imported_rg_dev.name

    identity {
    type = "SystemAssigned"
  }  
}