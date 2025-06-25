# AWS Managed Grafana Terraform Module

## Overview
This Terraform module provisions an AWS Managed Grafana workspace, configures authentication and access, and sets up API keys for different roles.

## Features
- Creates an AWS Managed Grafana workspace
- Configures authentication via AWS SSO
- Defines API keys for different user roles (Viewer, Editor, Admin)
- Supports multiple data sources (e.g., CloudWatch, Prometheus, etc.)

## Usage
```hcl
module "managed_grafana" {
  source = "Senora-dev/grafana/aws"

  name                      = "${var.environment_name}-grafana"
  description               = "AWS Managed Grafana service ${var.environment_name} environment."
  account_access_type       = "CURRENT_ACCOUNT"
  authentication_providers  = ["AWS_SSO"]
  permission_type           = "SERVICE_MANAGED"
  data_sources              = var.data_sources
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
    Terraform   = "true"
    Environment = var.environment_name
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }
}
```

## Inputs

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `environment_name` | The name of the environment, used as a prefix for Grafana resource names | `string` | n/a |
| `data_sources` | List of data sources for Grafana (e.g., `CLOUDWATCH`, `PROMETHEUS`) | `list(string)` | `["CLOUDWATCH"]` |

## Outputs

| Output | Description |
|--------|-------------|
| `grafana_workspace_id` | The ID of the created AWS Managed Grafana workspace |
| `grafana_workspace_url` | The URL of the AWS Managed Grafana workspace |

## Security
- Uses AWS SSO for authentication.
- API keys are generated for different roles (Viewer, Editor, Admin) with restricted permissions.

## License
This module is licensed under the MIT License.

---

## 🤝 Contributing
Contributions are welcome!
Fork the repository and submit a pull request with bug fixes, improvements, or new features.

For more details, reach out to the repository owner.
Visit [Senora.dev](https://Senora.dev)💜 for more platform-related services.