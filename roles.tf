#=====================================
# Viget admin role
#=====================================

# Create admin IAM role for SAML 2.0 federation.
resource "aws_iam_role" "admin_federation_role" {
  name               = "viget_admin_federation_role"
  assume_role_policy = data.aws_iam_policy_document.admin_saml_assume_role_policy.json

  tags = var.tags
}

# Define the IAM policy document that allows federated admin users to assume the role.
data "aws_iam_policy_document" "admin_saml_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithSAML"]
    effect  = "Allow"

    # Grant access to the SAML provider.
    principals {
      type        = "Federated"
      identifiers = [aws_iam_saml_provider.admin.arn]
    }

    # Require that the SAML assertion is destined for AWS.
    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }
}

## Attach policies to admin IAM role for SAML 2.0 federation.
resource "aws_iam_role_policy_attachment" "admin_federation_role__aws_admin" {
  role       = aws_iam_role.admin_federation_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#=====================================
# Viget developer role
#=====================================

## Create developer IAM role for SAML 2.0 federation.
resource "aws_iam_role" "developer_federation_role" {
  name               = "viget_developer_federation_role"
  assume_role_policy = data.aws_iam_policy_document.developer_saml_assume_role_policy.json

  tags = var.tags
}

## Define the IAM policy document that allows federated developer users to assume the role.
data "aws_iam_policy_document" "developer_saml_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithSAML"]
    effect  = "Allow"

    # Grant access to the SAML provider.
    principals {
      type        = "Federated"
      identifiers = [aws_iam_saml_provider.developer.arn]
    }

    # Require that the SAML assertion is destined for AWS.
    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }
}

## Attach policies to developer IAM role for SAML 2.0 federation.
resource "aws_iam_role_policy_attachment" "developer_federation_role__aws_poweruser" {
  role       = aws_iam_role.developer_federation_role.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

#=====================================
# Viget pm role
#=====================================

## Create pm IAM role for SAML 2.0 federation.
resource "aws_iam_role" "pm_federation_role" {
  name               = "viget_pm_federation_role"
  assume_role_policy = data.aws_iam_policy_document.pm_saml_assume_role_policy.json

  tags = var.tags
}

## Define the IAM policy document that allows federated pm users to assume the role.
data "aws_iam_policy_document" "pm_saml_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithSAML"]
    effect  = "Allow"

    # Grant access to the SAML provider.
    principals {
      type        = "Federated"
      identifiers = [aws_iam_saml_provider.pm.arn]
    }

    # Require that the SAML assertion is destined for AWS.
    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }
}

## Attach policies to pm IAM role for SAML 2.0 federation.
resource "aws_iam_role_policy_attachment" "pm_federation_role__aws_viewer" {
  role       = aws_iam_role.pm_federation_role.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "pm_federation_role__aws_billing" {
  role       = aws_iam_role.pm_federation_role.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}
