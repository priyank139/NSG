resource "azurerm_network_security_group" "ot_securitygroup" {
  count             = length(var.nsg_name)  
  name              = element(var.nsg_name, count.index)
  location =  element(var.rglocation, count.index )  
   resource_group_name  = var.resource_group_name

}

  
resource "azurerm_network_security_rule" "otsecurityrule" {
  count = length(var.security_rules)
  name = var.security_rules[count.index].name
  priority = var.security_rules[count.index].priority
  direction                   = var.security_rules[count.index].direction
  access                      = var.security_rules[count.index].access
  protocol                    = var.security_rules[count.index].protocol
  source_port_range           = var.security_rules[count.index].source_port_range
  destination_port_range      = var.security_rules[count.index].destination_port_range
  source_address_prefix       = "${var.security_rules[count.index].destination_port_range == "80" ? "*" : element(var.source_address_prefix, count.index)}"
  #"${element(var.source_address_prefix, count.index)}"
  destination_address_prefix  = var.security_rules[count.index].destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = "${element(var.NSG_name, count.index)}"
  
}

resource "azurerm_network_security_rule" "otsecurity-outrule" {
 count = length(var.security_outrules)
  name = var.security_outrules[count.index].name
  priority = var.security_outrules[count.index].priority
  direction                   = var.security_outrules[count.index].direction
  access                      = var.security_outrules[count.index].access
  protocol                    = var.security_outrules[count.index].protocol
  source_port_range           = var.security_outrules[count.index].source_port_range
  destination_port_range      = var.security_outrules[count.index].destination_port_range
  source_address_prefix       = var.security_outrules[count.index].source_address_prefix
  destination_address_prefix  = var.security_outrules[count.index].destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = "${element(var.NSG_name, count.index)}"
  
}
###################################   Public Rule #################### ##############

resource "azurerm_network_security_group" "ot_publicsecuritygroup" { 
  count             = length(var.publicnsg_name)  
  name              = element(var.publicnsg_name, count.index)
  location = element(var.rg_locations, count.index )
  #location = element(var.rglocation, count.index )  
  resource_group_name  = var.resource_group_name

  security_rule {
    name                        = "publicot-nsg-rule-${count.index+1}"
    priority                    = 100 + count.index
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
}

