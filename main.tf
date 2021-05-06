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




module "eks" {
  source = "terraform-aws-modules/eks/aws"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.public_subnets
  cluster_version = var.cluster_version
  
 
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capaicty     = 2
 
      instance_type = "t2.small"
    }
  }
  manage_aws_auth = false

  depends_on = [
    module.vpc
      ]
}
