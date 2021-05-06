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
    module.vpc_prod
      ]
}
