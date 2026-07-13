data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "fw_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]


}

resource "azurerm_public_ip" "fw_pip" {
  name                = var.fw_pip
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_firewall" "fw" {
  name                = local.fw_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.fw_subnet.id
    public_ip_address_id = azurerm_public_ip.fw_pip.id
  }
}

resource "azurerm_firewall_application_rule_collection" "fw_app_rule" {
  name                = local.fw_app_rc_name
  azure_firewall_name = azurerm_firewall.fw.name
  resource_group_name = data.azurerm_resource_group.rg.name
  priority            = 100
  action              = "Allow"

  dynamic "rule" {
    for_each = local.app_rules

    content {
      name             = rule.key
      source_addresses = rule.value.source_addresses
      target_fqdns     = rule.value.target_fqdns

      protocol {
        port = rule.value.port
        type = rule.value.type
      }
    }
  }
}



resource "azurerm_firewall_network_rule_collection" "fw_net_rule" {
  name                = local.fw_net_rc_name
  azure_firewall_name = azurerm_firewall.fw.name
  resource_group_name = data.azurerm_resource_group.rg.name
  priority            = 200
  action              = "Allow"

  rule {
    name = "allow-dns"

    source_addresses = [
      "10.0.0.0/16",
    ]

    destination_ports = [
      "53",
    ]

    destination_addresses = [var.aks_loadbalancer_ip]

    protocols = [
      "TCP",
      "UDP",
    ]
  }
}



resource "azurerm_firewall_nat_rule_collection" "fw_nat_rule" {
  name                = local.fw_nat_rc_name
  azure_firewall_name = azurerm_firewall.fw.name
  resource_group_name = data.azurerm_resource_group.rg.name
  priority            = 300
  action              = "Dnat"

  rule {
    name = "nginx-http"

    source_addresses = [
      "*"
    ]

    destination_ports = [
      "80",
    ]

    destination_addresses = [
      azurerm_public_ip.fw_pip.ip_address
    ]

    translated_port = 80

    translated_address = var.aks_loadbalancer_ip

    protocols = [
      "TCP"
    ]
  }
}


resource "azurerm_route_table" "fw_rt" {
  name                = local.fw_rt_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name

  route {

    name = "default-route"

    address_prefix = "0.0.0.0/0"

    next_hop_type = "VirtualAppliance"

    next_hop_in_ip_address = azurerm_firewall.fw.ip_configuration[0].private_ip_address

  }

  tags = var.tags
}

resource "azurerm_subnet_route_table_association" "example" {
  subnet_id      = data.azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.fw_rt.id
}


