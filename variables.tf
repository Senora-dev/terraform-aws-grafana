variable "environment_name" {
    type = string
    description = "The name of the environment, used as a prefix for Grafana resource names."
}

variable "data_sources" {
    type = list(string)
    description = "Data resources list for Grafana."
    default = ["CLOUDWATCH"]
}

variable "account_access_type" {
    type = string
    description = "The type of account access for the Grafana workspace."
    default = "CURRENT_ACCOUNT"
}

variable "authentication_providers" {
    type = list(string)
    description = "The authentication providers for the Grafana workspace."
    default = ["AWS_SSO"]
}

variable "permission_type" {
    type = string
    description = "The permission type for the Grafana workspace."
    default = "SERVICE_MANAGED"
}

variable "notification_destinations" {
    type = list(string)
    description = "The notification destinations for the Grafana workspace."
    default = ["SNS"]
}

variable "workspace_api_keys" {
    type = map(object({
        key_name        = string
        key_role        = string
        seconds_to_live = number
    }))
    description = "The API keys for the Grafana workspace."
    default = {
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
}

variable "tags" {
    type = map(string)
    description = "A map of tags to add to all resources."
    default = {}
}
