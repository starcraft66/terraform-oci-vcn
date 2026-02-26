# Copyright (c) 2019, 2020 Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

output "vcn_id" {
  description = "id of vcn that is created"
  value       = oci_core_vcn.vcn.id
}


output "nat_gateway_id" {
  description = "id of nat gateway if it is created"
  value       = join(",", oci_core_nat_gateway.nat_gateway[*].id)
}

output "internet_gateway_id" {
  description = "id of internet gateway if it is created"
  value       = join(",", oci_core_internet_gateway.ig[*].id)
}

output "service_gateway_id" {
  description = "id of service gateway if it is created"
  value       = join(",", oci_core_service_gateway.service_gateway[*].id)
}

output "ig_route_id" {
  description = "id of internet gateway route table"
  value       = join(",", oci_core_route_table.ig[*].id)
}

output "ipv6_nat_route_id" {
  description = "id of the dual-stack route table (NAT Gateway for IPv4, Internet Gateway for IPv6)"
  value       = one(oci_core_route_table.ipv6_nat[*].id)
}

output "nat_route_id" {
  description = "id of VCN NAT gateway route table"
  value       = join(",", oci_core_route_table.nat[*].id)
}

output "sgw_route_id" {
  description = "id of VCN Service gateway route table"
  value       = join(",", oci_core_route_table.service_gw[*].id)
}

# New complete outputs for each resources with provider parity. Auto-updating.
# Usefull for module composition.


output "internet_gateway_all_attributes" {
  description = "all attributes of created internet gateway"
  value       = { for k, v in oci_core_internet_gateway.ig : k => v }
}

output "ig_route_all_attributes" {
  description = "all attributes of created ig route table"
  value       = { for k, v in oci_core_route_table.ig : k => v }
}

output "ipv6_nat_route_all_attributes" {
  description = "all attributes of the dual-stack route table (NAT for IPv4, IGW for IPv6)"
  value       = { for k, v in oci_core_route_table.ipv6_nat : k => v }
}

output "lpg_all_attributes" {
  description = "all attributes of created lpg"
  value       = { for k, v in oci_core_local_peering_gateway.lpg : k => v }
}

output "nat_gateway_all_attributes" {
  description = "all attributes of created nat gateway"
  value       = { for k, v in oci_core_nat_gateway.nat_gateway : k => v }
}

output "nat_route_all_attributes" {
  description = "all attributes of created nat gateway route table"
  value       = { for k, v in oci_core_route_table.nat : k => v }
}

output "service_gateway_all_attributes" {
  description = "all attributes of created service gateway"
  value       = { for k, v in oci_core_service_gateway.service_gateway : k => v }
}

output "vcn_all_attributes" {
  description = "all attributes of created vcn"
  value       = { for k, v in oci_core_vcn.vcn : k => v }
}

output "vcn_ipv6cidr_blocks" {
  description = "IPv6 CIDR blocks of the VCN (includes Oracle GUA, ULA, and BYOIPv6 prefixes)"
  value       = oci_core_vcn.vcn.ipv6cidr_blocks
}

# subnet
output "subnet_id" {
  value = try(module.subnet[0].subnet_id, null)
}

output "subnet_all_attributes" {
  value = try(module.subnet[0].all_attributes, null)
}

output "default_security_list_id" {
  value = try(oci_core_vcn.vcn.default_security_list_id, null)
}
