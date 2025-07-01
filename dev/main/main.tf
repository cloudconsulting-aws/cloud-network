data "aws_availability_zones" "azs" {
  state = "available"
}

module "vpc" {
  source                  = "git::https://github.com/cloudconsulting-aws/terraform-aws-vpc.git?ref=v1.1.0"
  vpc_cidr_block          = "10.0.0.0/16"
  public_subnet_count     = 2
  private_subnet_count    = 2
  ips_per_subnet_exponent = 8
  project_name            = "main-project"
  availability_zones      = data.aws_availability_zones.azs.names
  tags                    = module.tags.tags
}

module "tags" {
  source                  = "git::https://github.com/cloudconsulting-aws/terraform-aws-tags.git?ref=v1.1.0"
  owner                   = "cloudnx"
  environment             = "dev"
  deployed_with_terraform = true
  repository              = "cloudconsulting-aws/cloud-network/main"
  cost_center             = "cloudnx"
  project_name            = "Main Project"
  confidential            = false
  backup_enabled          = false
}
