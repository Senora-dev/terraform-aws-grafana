module "managed_grafana" {
  source = "terraform-aws-modules/managed-service-grafana/aws"

  # Workspace
  name                      = "${var.environment_name}-grafana"
  description               = "AWS Managed Grafana service ${var.environment_name} environment."
  account_access_type       = var.account_access_type
  authentication_providers  = var.authentication_providers
  permission_type          = var.permission_type
  data_sources             = var.data_sources
  notification_destinations = var.notification_destinations
  associate_license        = false  # Disable license association

  # Workspace API keys
  workspace_api_keys = var.workspace_api_keys

  tags = merge(
    {
      Terraform   = "true"
      Environment = var.environment_name
    },
    var.tags
  )
}
