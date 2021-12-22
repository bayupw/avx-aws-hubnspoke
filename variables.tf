variable "aws_account" {}
variable "aws_vpc" {}
variable "security_domain" {}
variable "aws_transit_region" {}
variable "aws_transit_instance_size" {}
variable "aws_transit_ha_gw" {}
variable "aws_transit_enable_transit_firenet" {}

variable "aws_spoke_region" {}
variable "aws_spoke_subnet_size" {}
variable "aws_spoke_num_of_subnet_pairs" {}
variable "aws_spoke_ha_gw" {}
variable "aws_spoke_gw_size" {}

/* variable "instance_type" {}
variable "key_name" {}
variable "instance_username" {}
variable "instance_password" {}

variable "ingress_description" {}
variable "ingress_from_port" {}
variable "ingress_to_port" {}
variable "ingress_protocol" {}
variable "ingress_cidr_blocks" {} */