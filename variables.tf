variable "client_id" {}
variable "client_secret" {}

variable "agent_count" {
    default = 2
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "mfsconsultingws"
}

variable cluster_name {
    default = "mfsconsultingaks"
}

variable resource_group_name {
    default = "aks-ms-workshop"
}

variable location {
    default = "West Europe"
}

variable log_analytics_workspace_name {
    default = "mfsconsultingloganalytics"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "westeurope"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}

variable vnet_name {
    default = "aks-vnet"
}

variable subnet_name {
    default = "aks-subnet"
}

variable node_resource_group {
    default = "nodesresourcesrg"
}

variable acr_name {
    default = "mfsconsultingacr"
}