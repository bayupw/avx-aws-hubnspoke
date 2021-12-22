# AWS
aws_account = "AWS-BW"

aws_vpc = {
  transit_vpc = {
    "aws-transitfirenet" = "10.255.0.0/23"
  }
  seg0_spoke_vpc = {
    "aws-production-1" = "10.1.1.0/24",
    "aws-production-2" = "10.1.2.0/24"
  }
  seg1_spoke_vpc = {
    "aws-development-1" = "10.2.1.0/24",
    "aws-development-2" = "10.2.2.0/24"
  }
}

security_domain                    = ["production", "development"]
aws_transit_region                 = "us-east-1"
aws_transit_instance_size          = "t2.micro"
aws_transit_ha_gw                  = false
aws_transit_enable_transit_firenet = false

#Spoke Gateways
aws_spoke_region              = "us-east-1"
aws_spoke_subnet_size         = "28"
aws_spoke_num_of_subnet_pairs = "2"
aws_spoke_ha_gw               = false
aws_spoke_gw_size             = "t2.micro"

/* # EC2 variables
instance_type = "t2.micro"
key_name      = "vm_keypair"

instance_username = "ubuntu"
instance_password = "Aviatrix123"

ingress_description = "Allow Any Ingress"
ingress_from_port   = 0
ingress_to_port     = 0
ingress_protocol    = "-1"
ingress_cidr_blocks = "0.0.0.0/0" */