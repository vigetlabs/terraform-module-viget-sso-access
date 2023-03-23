# Create the Viget admin SAML provider using the metadata from an external Identity Provider (IdP).
resource "aws_iam_saml_provider" "admin" {
  name                   = "viget_admin"
  saml_metadata_document = var.saml_metadata.admin

  tags = var.tags
}

# Create the Viget developer SAML provider using the metadata from an external Identity Provider (IdP).
resource "aws_iam_saml_provider" "developer" {
  name                   = "viget_developer"
  saml_metadata_document = var.saml_metadata.developer

  tags = var.tags
}

# Create the Viget pm SAML provider using the metadata from an external Identity Provider (IdP).
resource "aws_iam_saml_provider" "pm" {
  name                   = "viget_pm"
  saml_metadata_document = var.saml_metadata.pm

  tags = var.tags
}
