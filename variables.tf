variable "name" {
  type        = string
  default     = ""
  description = "Name (e.g. `app` or `cluster`)."
}


variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}


variable "managedby" {
  type        = string
  default     = "anmol@clouddrove.com"
  description = "ManagedBy, e.g. 'CloudDrove' or 'AnmolNagpal'."
}

variable "label_order" {
  type        = list(string)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`, `application`."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "sign_in_audience" {
  type        = string
  description = "The Microsoft account types that are supported for the current application. Must be one of `AzureADMyOrg`, `AzureADMultipleOrgs`, `AzureADandPersonalMicrosoftAccount` or `PersonalMicrosoftAccount`"
  default     = "AzureADMyOrg"
}

variable "alternative_names" {
  type        = list(string)
  description = "A set of alternative names, used to retrieve service principals by subscription, identify resource group and full resource ids for managed identities."
  default     = []
}

variable "description" {
  type        = string
  description = "A description of the service principal provided for internal end-users."
  default     = null
}
variable "password_end_date" {
  type        = string
  description = "The relative duration or RFC3339 rotation timestamp after which the password expire"
  default     = null
}

variable "password_rotation_in_years" {
  type        = number
  description = "Number of years to add to the base timestamp to configure the password rotation timestamp. Conflicts with password_end_date and either one must be specified, not both."
  default     = null
}

variable "password_rotation_in_days" {
  type        = number
  description = "Number of days to add to the base timestamp to configure the rotation timestamp. When the current time has passed the rotation timestamp, the resource will trigger recreation. Conflicts with `password_end_date`, `password_rotation_in_years` and either one must be specified, not all."
  default     = null
}

variable "enable_service_principal_certificate" {
  type        = bool
  description = "Manages a Certificate associated with a Service Principal within Azure Active Directory"
  default     = false
}

variable "certificate_encoding" {
  type        = string
  description = "Specifies the encoding used for the supplied certificate data. Must be one of `pem`, `base64` or `hex`"
  default     = "pem"
}

variable "key_id" {
  type        = string
  description = "A UUID used to uniquely identify this certificate. If not specified a UUID will be automatically generated."
  default     = null
}

variable "certificate_type" {
  type        = string
  description = "The type of key/certificate. Must be one of AsymmetricX509Cert or Symmetric"
  default     = "AsymmetricX509Cert"
}



variable "azure_role_name" {
  type        = string
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified."
  default     = null
}

variable "azure_role_description" {
  type        = string
  description = "The description for this Role Assignment"
  default     = null
}

variable "assignments" {
  type = list(object({
    scope                = string
    role_definition_name = string
  }))
  description = "The list of role assignments to this service principal"
  default     = []
}

variable "device_only_auth_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether this application supports device authentication without a user. Defaults to false."
}

variable "fallback_public_client_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether the application is a public client. Appropriate for apps using token grant flows that don't use a redirect URI. Defaults to false."
}

variable "group_membership_claims" {
  type        = list(string)
  default     = []
  description = "Configures the groups claim issued in a user or OAuth 2.0 access token that the app expects. Possible values are None, SecurityGroup, DirectoryRole, ApplicationGroup or All."
}

variable "identifier_uris" {
  type        = list(string)
  default     = []
  description = "A set of user-defined URI(s) that uniquely identify an application within its Azure AD tenant, or within a verified custom domain if the application is multi-tenant."
}

variable "logo_image" {
  type        = string
  default     = null
  description = "A logo image to upload for the application, as a raw base64-encoded string. The image should be in gif, jpeg or png format. Note that once an image has been uploaded, it is not possible to remove it without replacing it with another image."
}

variable "account_enabled" {
  type        = bool
  default     = true
  description = "Whether or not the service principal account is enabled. Defaults to true."
}

variable "app_role_assignment_required" {
  type        = bool
  default     = false
  description = "Whether this service principal requires an app role assignment to a user or group before Azure AD will issue a user or access token to the application. Defaults to false."
}

variable "login_url" {
  type        = string
  default     = null
  description = "The URL where the service provider redirects the user to Azure AD to authenticate. Azure AD uses the URL to launch the application from Microsoft 365 or the Azure AD My Apps. When blank, Azure AD performs IdP-initiated sign-on for applications configured with SAML-based single sign-on."
}

variable "notes" {
  type        = string
  default     = null
  description = "A free text field to capture information about the service principal, typically used for operational purposes."
}

variable "notification_email_addresses" {
  type        = list(string)
  default     = []
  description = "A set of email addresses where Azure AD sends a notification when the active certificate is near the expiration date. This is only for the certificates used to sign the SAML token issued for Azure AD Gallery applications."
}

variable "preferred_single_sign_on_mode" {
  type        = string
  default     = ""
  description = "The single sign-on mode configured for this application. Azure AD uses the preferred single sign-on mode to launch the application from Microsoft 365 or the Azure AD My Apps. Supported values are oidc, password, saml or notSupported. Omit this property or specify a blank string to unset."
}

variable "relay_state" {
  type        = string
  default     = null
  description = "The relative URI the service provider would redirect to after completion of the single sign-on flow."
}

variable "use_existing" {
  type        = bool
  default     = false
  description = "When true, any existing service principal linked to the same application will be automatically imported. When false, an import error will be raised for any pre-existing service principal."
}

variable "certificate_value" {
  type        = string
  default     = ""
  description = "The certificate data, which can be PEM encoded, base64 encoded DER or hexadecimal encoded DER. See also the encoding argument."
}

variable "end_date" {
  type        = string
  default     = ""
  description = "The end date until which the password is valid, formatted as an RFC3339 date string (e.g. 2018-01-01T01:02:03Z). Changing this field forces a new resource to be created."
}

variable "display_name" {
  type        = string
  default     = "example.com"
  description = "Specifies a friendly name for the certificate. Must start with CN=. Changing this field forces a new resource to be created."
}
