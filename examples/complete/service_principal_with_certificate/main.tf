# Azurerm provider configuration
provider "azurerm" {
  features {}
  subscription_id = "000000-11111-1223-XXX-XXXXXXXXXXXX"
}

module "service-principal" {
  source                               = "./../../.."
  name                                 = "app"
  environment                          = "test"
  enable_service_principal_certificate = true
  end_date                             = "2027-10-04T01:02:03Z" # Adjusted end date
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
  assignments = [
    {
      scope                = "/subscriptions/000000-11111-1223-XXX-XXXXXXXXXXXX"
      role_definition_name = "owner"
    },
  ]
}
