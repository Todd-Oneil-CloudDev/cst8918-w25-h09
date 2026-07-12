resource "azurerm_resource_group" "app" {
  name     = "${var.prefix}lab-h09-rg"
  location = var.region
}

# Fetch the latest available Kubernetes version for the region
# data "azurerm_kubernetes_service_versions" "current" {
#   location        = azurerm_resource_group.app.location
#   include_preview = false
# }

resource "azurerm_kubernetes_cluster" "app" {

  name                = "${var.prefix}-aks"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  dns_prefix          = "${var.prefix}-aks-dns"

  # kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version

  default_node_pool {
    name                = "default"
    vm_size             = "Standard_B2s"
    auto_scaling_enabled = true
    min_count           = 1
    max_count           = 3
  }

  identity {
    type = "SystemAssigned"
  }
}