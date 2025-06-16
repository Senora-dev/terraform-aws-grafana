# Complete Grafana Example

A complete example of using the `terraform-aws-grafana` module to create an AWS Managed Grafana workspace with all features.

## Features

- AWS Managed Grafana workspace
- Multiple data sources (CloudWatch, Prometheus, X-Ray)
- AWS SSO authentication
- Service-managed permissions
- SNS notification destinations
- API keys for different access levels
- Proper resource tagging

## Usage

```hcl
provider "aws" {
  region = "us-west-2"
}

module "grafana" {
  source = "../../"

  environment_name = "prod"
  
  data_sources = [
    "CLOUDWATCH",
    "PROMETHEUS",
    "XRAY"
  ]

  account_access_type = "CURRENT_ACCOUNT"
  authentication_providers = ["AWS_SSO"]
  permission_type = "SERVICE_MANAGED"
  notification_destinations = ["SNS"]

  workspace_api_keys = {
    viewer = {
      key_name        = "viewer"
      key_role        = "VIEWER"
      seconds_to_live = 3600
    }
    editor = {
      key_name        = "editor"
      key_role        = "EDITOR"
      seconds_to_live = 3600
    }
    admin = {
      key_name        = "admin"
      key_role        = "ADMIN"
      seconds_to_live = 3600
    }
  }

  tags = {
    Environment = "prod"
    Terraform   = "true"
    Project     = "example"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 4.0 |

## Outputs

| Name | Description |
|------|-------------|
| workspace_id | The ID of the Grafana workspace |
| workspace_endpoint | The endpoint of the Grafana workspace |
| workspace_arn | The ARN of the Grafana workspace |
| workspace_api_keys | The API keys for the Grafana workspace (sensitive) |

## Notes

- The example creates a complete AWS Managed Grafana workspace
- Multiple data sources are configured for comprehensive monitoring
- AWS SSO is used for authentication
- API keys are created for different access levels (viewer, editor, admin)
- SNS is configured for notifications
- All resources are properly tagged 