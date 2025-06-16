output "workspace_id" {
  description = "The ID of the Grafana workspace"
  value       = module.grafana.workspace_id
}

output "workspace_endpoint" {
  description = "The endpoint of the Grafana workspace"
  value       = module.grafana.workspace_endpoint
}

output "workspace_url" {
  description = "The URL of the Grafana workspace"
  value       = "https://${module.grafana.workspace_endpoint}"
}

output "workspace_arn" {
  description = "The ARN of the Grafana workspace"
  value       = module.grafana.workspace_arn
}

output "workspace_api_keys" {
  description = "The API keys for the Grafana workspace"
  value       = module.grafana.workspace_api_keys
  sensitive   = true
} 