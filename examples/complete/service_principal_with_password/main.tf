provider "azurerm" {
  features {}
  subscription_id = "068245d4-3c94-42fe-9c4d-9e5e1cabc60c"
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
      scope                = "/subscriptions/068245d4-3c94-42fe-9c4d-9e5e1cabc60c"
      role_definition_name = "owner"
    },
  ]
}
