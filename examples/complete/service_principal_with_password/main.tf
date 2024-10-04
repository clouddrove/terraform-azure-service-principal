provider "azurerm" {
  features {}
  subscription_id = "000000-11111-1223-XXX-XXXXXXXXXXXX"
}
module "service-principal" {
  source                     = "./../../.."
  name                       = "app"
  environment                = "test"
  password_rotation_in_years = 1
  end_date                   = "2027-10-04T01:02:03Z" # Ensure this is within 3 years of the start date

  # Adding roles and scope to service principal
  assignments = [
    {
      scope                = "/subscriptions/000000-11111-1223-XXX-XXXXXXXXXXXX"
      role_definition_name = "owner"
    },
  ]
}
