module "aws_transit" {
  for_each = var.aws_vpc.transit_vpc

  source  = "terraform-aviatrix-modules/aws-transit/aviatrix"
  version = "v4.0.3"

  region                 = var.aws_transit_region
  account                = var.aws_account
  name                   = each.key
  cidr                   = each.value
  instance_size          = var.aws_transit_instance_size
  ha_gw                  = var.aws_transit_ha_gw
  enable_transit_firenet = var.aws_transit_enable_transit_firenet
  enable_segmentation    = true

  prefix = false
  suffix = false
}

resource "aviatrix_segmentation_security_domain" "segmentation_security_domain" {
  count       = length(var.security_domain)
  domain_name = var.security_domain[count.index]
}

module "seg0_aws_spoke" {
  for_each = var.aws_vpc.seg0_spoke_vpc

  source  = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version = "4.0.3"

  region  = var.aws_transit_region
  account = var.aws_account

  name             = each.key
  cidr             = each.value
  transit_gw       = module.aws_transit[keys(var.aws_vpc.transit_vpc)[0]].transit_gateway.gw_name
  instance_size    = var.aws_spoke_gw_size
  vpc_subnet_size  = var.aws_spoke_subnet_size
  vpc_subnet_pairs = var.aws_spoke_num_of_subnet_pairs
  ha_gw            = var.aws_spoke_ha_gw
  security_domain  = aviatrix_segmentation_security_domain.segmentation_security_domain[0].domain_name

  prefix = false
  suffix = false
}

module "seg1_aws_spoke" {
  for_each = var.aws_vpc.seg1_spoke_vpc

  source  = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version = "4.0.3"

  region  = var.aws_spoke_region
  account = var.aws_account

  name             = each.key
  cidr             = each.value
  transit_gw       = module.aws_transit[keys(var.aws_vpc.transit_vpc)[0]].transit_gateway.gw_name
  instance_size    = var.aws_spoke_gw_size
  vpc_subnet_size  = var.aws_spoke_subnet_size
  vpc_subnet_pairs = var.aws_spoke_num_of_subnet_pairs
  ha_gw            = var.aws_spoke_ha_gw
  security_domain  = aviatrix_segmentation_security_domain.segmentation_security_domain[1].domain_name

  prefix = false
  suffix = false
}

/* 
output "map_seg0_aws_spoke" {
  value = {for k, v in module.seg0_aws_spoke: k => v.vpc}
} */

/* output "list_seg0_aws_spoke" {
  value = values(module.seg0_aws_spoke)[*].vpc.private_subnets[*].name
} */