resource "azurerm_template_deployment" "armDeployment" {
  name                = "adf_arm_deploy"
  resource_group_name = data.azurerm_resource_group.rg_dev.name
  deployment_mode     = "Incremental"
  template_body =  file("arm/ARMTemplateForFactory.json")
  parameters_body = file("arm/ARMTemplateForFactory.json")

}