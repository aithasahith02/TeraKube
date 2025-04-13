module "vpc" {
  source       = "./vpc"
  project_name = var.project_name
  aws_region   = var.aws_region
}

module "eks" {
  source       = "./eks"
  cluster_name = "${var.project_name}-eks"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.public_subnet_ids
}

