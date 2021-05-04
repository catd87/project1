provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {
    bucket = "storage-state"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.vpc_prod
  cidr = var.vpc_cidr
  #aws_region = var.aws_region  
  azs             = var.az_usw
  private_subnets = var.subn_private
  public_subnets = var.subn_public
  
  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "prod"
  }

}

output "vpc" {
  value = module.vpc
  
  }


