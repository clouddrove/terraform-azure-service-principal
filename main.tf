data "azuread_client_config" "current" {}

module "labels" {
  source      = "clouddrove/labels/azure"
  version     = "1.0.0"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}
resource "azuread_application" "main" {
  display_name                   = format("%s-service-principal", module.labels.id)
  identifier_uris                = var.identifier_uris
  device_only_auth_enabled       = var.device_only_auth_enabled
  fallback_public_client_enabled = var.fallback_public_client_enabled
  group_membership_claims        = var.group_membership_claims
  logo_image                     = var.logo_image
  owners                         = [data.azuread_client_config.current.object_id]
  sign_in_audience               = var.sign_in_audience
}

resource "azuread_service_principal" "main" {
  application_id                = azuread_application.main.application_id
  owners                        = [data.azuread_client_config.current.object_id]
  alternative_names             = var.alternative_names
  account_enabled               = var.account_enabled
  app_role_assignment_required  = var.app_role_assignment_required
  description                   = var.description
  login_url                     = var.login_url
  notes                         = var.notes
  notification_email_addresses  = var.notification_email_addresses
  preferred_single_sign_on_mode = var.preferred_single_sign_on_mode
  use_existing                  = var.use_existing
  saml_single_sign_on {
    relay_state = var.relay_state
  }
}

resource "time_rotating" "main" {
  rotation_rfc3339 = var.password_end_date
  rotation_years   = var.password_rotation_in_years
  rotation_days    = var.password_rotation_in_days

  triggers = {
    end_date = var.password_end_date
    years    = var.password_rotation_in_years
    days     = var.password_rotation_in_days
  }
}

resource "azuread_service_principal_password" "main" {
  count                = var.enable_service_principal_certificate == false ? 1 : 0
  service_principal_id = azuread_service_principal.main.object_id
  end_date             = var.end_date
  rotate_when_changed = {
    rotation = time_rotating.main.id
  }
}

resource "azuread_service_principal_certificate" "main" {
  count                = var.enable_service_principal_certificate == true ? 1 : 0
  service_principal_id = azuread_service_principal.main.id
  type                 = var.certificate_type
  encoding             = var.certificate_encoding
  key_id               = var.key_id
  value                = var.certificate_value
  end_date             = time_rotating.main.id
}

resource "azuread_service_principal_token_signing_certificate" "main" {
  count                = var.enable_service_principal_certificate == true ? 1 : 0
  service_principal_id = azuread_service_principal.main.id
  display_name         = "CN=${var.display_name}"
  end_date             = var.end_date
}

resource "azurerm_role_assignment" "main" {
  count                = length(var.assignments)
  name                 = var.azure_role_name
  description          = var.azure_role_description
  scope                = var.assignments[count.index].scope
  role_definition_name = var.assignments[count.index].role_definition_name
  principal_id         = azuread_service_principal.main.object_id
}
