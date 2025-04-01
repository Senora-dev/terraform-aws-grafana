variable "environment_name" {
    type = string
    description = "The name of the environment, used as a prefix for Grafana resource names."
}

variable "data_sources" {
    type = list(string)
    description = "Data resources list for Grafana."
    default = ["CLOUDWATCH"]
}
