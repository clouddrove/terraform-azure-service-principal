output "service_principal_name" {
  description = "The object id of service principal. Can be used to assign roles to user."
  value       = azuread_service_principal.main.display_name
}

output "service_principal_object_id" {
  description = "The object id of service principal. Can be used to assign roles to user."
  value       = azuread_service_principal.main.object_id
}

output "service_principal_application_id" {
  description = "The client ID of the service principal. Can be used to assign roles to users."
  value       = azuread_service_principal.main.client_id
}

output "client_id" {
  description = "The client ID of the Azure AD application created."
  value       = azuread_application.main.client_id
}

output "client_secret" {
  description = "Password for service principal."
  value       = azuread_service_principal_password.main.*.value
  sensitive   = true
}

output "service_principal_password" {
  description = "Password for service principal."
  value       = azuread_service_principal_password.main.*.value
  sensitive   = true
}

