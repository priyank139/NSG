variable "resource_group_name" {
  type = string
}
variable "rglocation" {
   type = list(string)
 }
 variable "publicnsg_name" {
   type = list(string)
 }

 variable "source_address_prefix" {
   type = list(string)
 }


variable "nsg_name" {
  type = list(string)
}
variable "NSG_name" {
  type = list(string)
}

#####################
variable "security_rules" {
  type = list
  default = []
}

variable "security_outrules" {
  type = list
  default = []
}
##
variable "rg_locations" {
  type = any
}