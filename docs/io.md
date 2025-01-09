## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_enabled | Whether or not the service principal account is enabled. Defaults to true. | `bool` | `true` | no |
| alternative\_names | A set of alternative names, used to retrieve service principals by subscription, identify resource group and full resource ids for managed identities. | `list(string)` | `[]` | no |
| app\_role\_assignment\_required | Whether this service principal requires an app role assignment to a user or group before Azure AD will issue a user or access token to the application. Defaults to false. | `bool` | `false` | no |
| assignments | The list of role assignments to this service principal | <pre>list(object({<br>    scope                = string<br>    role_definition_name = string<br>  }))</pre> | `[]` | no |
| azure\_role\_description | The description for this Role Assignment | `string` | `null` | no |
| azure\_role\_name | A unique UUID/GUID for this Role Assignment - one will be generated if not specified. | `string` | `null` | no |
| certificate\_encoding | Specifies the encoding used for the supplied certificate data. Must be one of `pem`, `base64` or `hex` | `string` | `"pem"` | no |
| certificate\_type | The type of key/certificate. Must be one of AsymmetricX509Cert or Symmetric | `string` | `"AsymmetricX509Cert"` | no |
| certificate\_value | The certificate data, which can be PEM encoded, base64 encoded DER or hexadecimal encoded DER. See also the encoding argument. | `string` | `""` | no |
| description | A description of the service principal provided for internal end-users. | `string` | `null` | no |
| device\_only\_auth\_enabled | Specifies whether this application supports device authentication without a user. Defaults to false. | `bool` | `false` | no |
| display\_name | Specifies a friendly name for the certificate. Must start with CN=. Changing this field forces a new resource to be created. | `string` | `"example.com"` | no |
| enable\_service\_principal\_certificate | Manages a Certificate associated with a Service Principal within Azure Active Directory | `bool` | `false` | no |
| end\_date | The end date until which the password is valid, formatted as an RFC3339 date string (e.g. 2018-01-01T01:02:03Z). Changing this field forces a new resource to be created. | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| fallback\_public\_client\_enabled | Specifies whether the application is a public client. Appropriate for apps using token grant flows that don't use a redirect URI. Defaults to false. | `bool` | `false` | no |
| group\_membership\_claims | Configures the groups claim issued in a user or OAuth 2.0 access token that the app expects. Possible values are None, SecurityGroup, DirectoryRole, ApplicationGroup or All. | `list(string)` | `[]` | no |
| identifier\_uris | A set of user-defined URI(s) that uniquely identify an application within its Azure AD tenant, or within a verified custom domain if the application is multi-tenant. | `list(string)` | `[]` | no |
| key\_id | A UUID used to uniquely identify this certificate. If not specified a UUID will be automatically generated. | `string` | `null` | no |
| label\_order | Label order, e.g. `name`, `application`. | `list(string)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| login\_url | The URL where the service provider redirects the user to Azure AD to authenticate. Azure AD uses the URL to launch the application from Microsoft 365 or the Azure AD My Apps. When blank, Azure AD performs IdP-initiated sign-on for applications configured with SAML-based single sign-on. | `string` | `null` | no |
| logo\_image | A logo image to upload for the application, as a raw base64-encoded string. The image should be in gif, jpeg or png format. Note that once an image has been uploaded, it is not possible to remove it without replacing it with another image. | `string` | `null` | no |
| managedby | ManagedBy, e.g. 'CloudDrove' or 'AnmolNagpal'. | `string` | `"anmol@clouddrove.com"` | no |
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| notes | A free text field to capture information about the service principal, typically used for operational purposes. | `string` | `null` | no |
| notification\_email\_addresses | A set of email addresses where Azure AD sends a notification when the active certificate is near the expiration date. This is only for the certificates used to sign the SAML token issued for Azure AD Gallery applications. | `list(string)` | `[]` | no |
| password\_end\_date | The relative duration or RFC3339 rotation timestamp after which the password expire | `string` | `null` | no |
| password\_rotation\_in\_days | Number of days to add to the base timestamp to configure the rotation timestamp. When the current time has passed the rotation timestamp, the resource will trigger recreation. Conflicts with `password_end_date`, `password_rotation_in_years` and either one must be specified, not all. | `number` | `null` | no |
| password\_rotation\_in\_years | Number of years to add to the base timestamp to configure the password rotation timestamp. Conflicts with password\_end\_date and either one must be specified, not both. | `number` | `null` | no |
| preferred\_single\_sign\_on\_mode | The single sign-on mode configured for this application. Azure AD uses the preferred single sign-on mode to launch the application from Microsoft 365 or the Azure AD My Apps. Supported values are oidc, password, saml or notSupported. Omit this property or specify a blank string to unset. | `string` | `""` | no |
| relay\_state | The relative URI the service provider would redirect to after completion of the single sign-on flow. | `string` | `null` | no |
| repository | Terraform current module repo | `string` | `""` | no |
| sign\_in\_audience | The Microsoft account types that are supported for the current application. Must be one of `AzureADMyOrg`, `AzureADMultipleOrgs`, `AzureADandPersonalMicrosoftAccount` or `PersonalMicrosoftAccount` | `string` | `"AzureADMyOrg"` | no |
| use\_existing | When true, any existing service principal linked to the same application will be automatically imported. When false, an import error will be raised for any pre-existing service principal. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| client\_id | The client ID of the Azure AD application created. |
| client\_secret | Password for service principal. |
| service\_principal\_client\_id | The client ID of the service principal. Can be used to assign roles to users. |
| service\_principal\_name | The object id of service principal. Can be used to assign roles to user. |
| service\_principal\_object\_id | The object id of service principal. Can be used to assign roles to user. |
| service\_principal\_password | Password for service principal. |

