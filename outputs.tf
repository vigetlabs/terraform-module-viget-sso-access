output "roles" {
  description = "Role names and their ARNs for mapping in IAM Identity Center"

  value = {
    admin = {
      name = aws_iam_role.admin_federation_role.name
      arn  = aws_iam_role.admin_federation_role.arn
    },
    developer = {
      name = aws_iam_role.developer_federation_role.name
      arn  = aws_iam_role.developer_federation_role.arn
    },
    pm = {
      name = aws_iam_role.pm_federation_role.name
      arn  = aws_iam_role.pm_federation_role.arn
    }
  }
}
