output "NSG_id" {
  value =  "${formatlist("%v",azurerm_network_security_group.ot_securitygroup.*.id)}"
}

output "public_NSG_id" {
  value =  "${formatlist("%v",azurerm_network_security_group.ot_publicsecuritygroup.*.id)}"
}

output "NSG_name" {
   value =  "${formatlist("%v",azurerm_network_security_group.ot_securitygroup.*.name)}"
}
output "public_NSG_name" {
  value =  "${formatlist("%v",azurerm_network_security_group.ot_publicsecuritygroup.*.name)}"
}