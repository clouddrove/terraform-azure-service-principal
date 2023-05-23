<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AZURE SERVICE PRINCIPAL
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create service principal resource on AZURE.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-azure-service-principal'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AZURE+SERVICE+PRINCIPAL&url=https://github.com/clouddrove/terraform-azure-service-principal'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AZURE+SERVICE+PRINCIPAL&url=https://github.com/clouddrove/terraform-azure-service-principal'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-azure-service-principal/releases).


Here are some examples of how you can use this module in your inventory structure:
### with password
```hcl
  module "service-principal" {
  source                         = "clouddrove/service-principal/azure"
  version                        = "1.0.0"
  name                           = "app"
  environment                    = "test"
  password_rotation_in_years     = 1
  end_date                       = "2024-05-01T01:02:03Z"
  # Adding roles and scope to service principal
  assignments = [
    {
      scope                = "/subscriptions/068245XXXXXXXXXXe1cabc60c"
      role_definition_name = "owner"
    },
  ]
}
```
  ### with certificate
```hcl
  module "virtual-machine" {
  source                               = "clouddrove/service-principal/azure"
  version                              = "1.0.0"
  name                                 = "app"
  environment                          = "test"
  enable_service_principal_certificate = true
  end_date                             = "2024-05-01T01:02:03Z"
  certificate_value                    = <<EOF
  MIIC5jCCAc6gAwIBAgIIUeUhLYf6UNwwDQYJKoZIhvcNAQELBQAwETEPMA0GA1UE
  AxMGVlBOIENBMB4XDTIyMTExMTE0MzA1NFoXDTI1MTExMDE0MzA1NFowETEPMA0G
  A1UEAxMGVlBOIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6bxr
  s1kwbRztA7mH7hxzcxzcbbhcdIXV8ehbzNIank1ByOqtBpQK1Xvde1z6rjL1hzCn
  XD6xjW+xfF+yQ/zMyc6udrK2OvtuFmAsBYL5Bbb+Nf7U6Rp9IWZA6f/HO+XLft6q
  sC0UD1wEK6LSn/1u+fCfT3UCMCjpskAtE3ossZCuhUjJ8jGNUb07Z84dQEQf0s3n
  13V0kqNfpaxAhttttttttWlEGigoTqk6NcTNAzUEGR1b4Rt8qNzIwk8DhODfiOwT
  ILsB3XWyA/IOv2eL3Eqx/lkykIBSEJALPE7j6igyTMoSPHtQA7NWrgYeWgiWh1AQ
  VJpuY1vAIm3gfMAEoQIDAQABo0IwQDAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB
  /wQEAwIBBjAdBgNVHQ4EFgQUiEbr34wufRJ6+1Fh5am89bxRCuswDQYJKoZIhvcN
  AQELBQADggEBABHs7e6X2uLpUPkfv0r8TH3MnskPEGObcqGDS8WWH0FO7hsbSMeZ
  bTxJue6WTUvwrxYrmfqRZU/K+TtDregsa+GAYsl0wbl82nu2gBivpARLXYenfmwc
  Zgul+ZwQPw7FB9rLugW7qKMhGUxYYnywTyfZI1EjP6ZAjYn7xB9G7zOGpkVCErPn
  LIO1Knhk7J2XIXs6wCw1OcLJfXhjEEbnYZaHYA3LCTot9LM+3ecloILUo7rQgooB
  4/YOgmo7Q3Qv0ahFvsEI/ZqSop6NpLlzIQ/T3hC/6m4aG/1u+yaac4E9ygZNg184
  Mb0BNzEPxRFt+L8A72gd/nTcxGrxEcQlqEc=
  EOF
  password_rotation_in_years           = 1
  # Adding roles and scope to service principal
  assignments = [
  {
  scope                = "/subscriptions/06824XXXXXXXXXXXXXXe5ebc60c"
  role_definition_name = "owner"
  },
  ]
}
```






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_enabled | Whether or not the service principal account is enabled. Defaults to true. | `bool` | `true` | no |
| alternative\_names | A set of alternative names, used to retrieve service principals by subscription, identify resource group and full resource ids for managed identities. | `list(string)` | `[]` | no |
| app\_role\_assignment\_required | Whether this service principal requires an app role assignment to a user or group before Azure AD will issue a user or access token to the application. Defaults to false. | `bool` | `false` | no |
| application | Application (e.g. `cd` or `clouddrove`). | `string` | `""` | no |
| assignments | The list of role assignments to this service principal | <pre>list(object({<br>    scope                = string<br>    role_definition_name = string<br>  }))</pre> | `[]` | no |
| azure\_role\_description | The description for this Role Assignment | `any` | `null` | no |
| azure\_role\_name | A unique UUID/GUID for this Role Assignment - one will be generated if not specified. | `any` | `null` | no |
| certificate\_encoding | Specifies the encoding used for the supplied certificate data. Must be one of `pem`, `base64` or `hex` | `string` | `"pem"` | no |
| certificate\_path | The path to the certificate for this Service Principal | `string` | `""` | no |
| certificate\_type | The type of key/certificate. Must be one of AsymmetricX509Cert or Symmetric | `string` | `"AsymmetricX509Cert"` | no |
| certificate\_value | The certificate data, which can be PEM encoded, base64 encoded DER or hexadecimal encoded DER. See also the encoding argument. | `string` | `""` | no |
| description | A description of the service principal provided for internal end-users. | `any` | `null` | no |
| device\_only\_auth\_enabled | Specifies whether this application supports device authentication without a user. Defaults to false. | `bool` | `false` | no |
| display\_name | Specifies a friendly name for the certificate. Must start with CN=. Changing this field forces a new resource to be created. | `string` | `"example.com"` | no |
| enable\_service\_principal\_certificate | Manages a Certificate associated with a Service Principal within Azure Active Directory | `bool` | `false` | no |
| end\_date | The end date until which the password is valid, formatted as an RFC3339 date string (e.g. 2018-01-01T01:02:03Z). Changing this field forces a new resource to be created. | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| fallback\_public\_client\_enabled | Specifies whether the application is a public client. Appropriate for apps using token grant flows that don't use a redirect URI. Defaults to false. | `bool` | `false` | no |
| group\_membership\_claims | Configures the groups claim issued in a user or OAuth 2.0 access token that the app expects. Possible values are None, SecurityGroup, DirectoryRole, ApplicationGroup or All. | `list(string)` | `[]` | no |
| identifier\_uris | A set of user-defined URI(s) that uniquely identify an application within its Azure AD tenant, or within a verified custom domain if the application is multi-tenant. | `list(any)` | `[]` | no |
| key\_id | A UUID used to uniquely identify this certificate. If not specified a UUID will be automatically generated. | `any` | `null` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| login\_url | The URL where the service provider redirects the user to Azure AD to authenticate. Azure AD uses the URL to launch the application from Microsoft 365 or the Azure AD My Apps. When blank, Azure AD performs IdP-initiated sign-on for applications configured with SAML-based single sign-on. | `string` | `null` | no |
| logo\_image | A logo image to upload for the application, as a raw base64-encoded string. The image should be in gif, jpeg or png format. Note that once an image has been uploaded, it is not possible to remove it without replacing it with another image. | `string` | `null` | no |
| managedby | ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'. | `string` | `"anmol@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| notes | A free text field to capture information about the service principal, typically used for operational purposes. | `string` | `null` | no |
| notification\_email\_addresses | A set of email addresses where Azure AD sends a notification when the active certificate is near the expiration date. This is only for the certificates used to sign the SAML token issued for Azure AD Gallery applications. | `list(any)` | `[]` | no |
| password\_end\_date | The relative duration or RFC3339 rotation timestamp after which the password expire | `any` | `null` | no |
| password\_rotation\_in\_days | Number of days to add to the base timestamp to configure the rotation timestamp. When the current time has passed the rotation timestamp, the resource will trigger recreation.Conflicts with `password_end_date`, `password_rotation_in_years` and either one must be specified, not all | `any` | `null` | no |
| password\_rotation\_in\_years | Number of years to add to the base timestamp to configure the password rotation timestamp. Conflicts with password\_end\_date and either one is specified and not the both | `any` | `null` | no |
| preferred\_single\_sign\_on\_mode | The single sign-on mode configured for this application. Azure AD uses the preferred single sign-on mode to launch the application from Microsoft 365 or the Azure AD My Apps. Supported values are oidc, password, saml or notSupported. Omit this property or specify a blank string to unset. | `string` | `""` | no |
| relay\_state | The relative URI the service provider would redirect to after completion of the single sign-on flow. | `string` | `null` | no |
| repository | Terraform current module repo | `string` | `""` | no |
| role\_definition\_name | The name of a Azure built-in Role for the service principal | `any` | `null` | no |
| service\_principal\_name | The name of the service principal | `string` | `""` | no |
| sign\_in\_audience | The Microsoft account types that are supported for the current application. Must be one of `AzureADMyOrg`, `AzureADMultipleOrgs`, `AzureADandPersonalMicrosoftAccount` or `PersonalMicrosoftAccount` | `string` | `"AzureADMyOrg"` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(any)` | `{}` | no |
| use\_existing | When true, any existing service principal linked to the same application will be automatically imported. When false, an import error will be raised for any pre-existing service principal. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| client\_id | The application id of AzureAD application created. |
| client\_secret | Password for service principal. |
| service\_principal\_application\_id | The object id of service principal. Can be used to assign roles to user. |
| service\_principal\_name | The object id of service principal. Can be used to assign roles to user. |
| service\_principal\_object\_id | The object id of service principal. Can be used to assign roles to user. |
| service\_principal\_password | Password for service principal. |




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-azure-service-principal/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-azure-service-principal)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
