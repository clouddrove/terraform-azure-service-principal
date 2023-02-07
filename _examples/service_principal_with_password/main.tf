# Azurerm provider configuration
provider "azurerm" {
  features {}
}

module "service-principal" {
  source                     = "./../.."
  name                       = "app"
  environment                = "test"
  label_order                = ["name", "environment"]
  password_rotation_in_years = 1
  end_date                   = "2024-05-01T01:02:03Z"
  # Adding roles and scope to service principal
  assignments = [
    {
      scope                = "/subscriptions/068XXXXXXXX1cabc60c"
      role_definition_name = "owner"
    },
  ]
}
