# terraform/eks/main.tf

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t2.small"]
      desired_size   = 1
      max_size       = 1
      min_size       = 1
    }
  }

  tags = {
    Project = var.cluster_name
  }
}

