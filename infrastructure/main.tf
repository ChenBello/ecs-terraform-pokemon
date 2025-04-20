module "vpc_module" {
  source             = "./modules/vpc"
  name               = "my-vpc"
  cidr               = "10.0.0.0/16"
  azs                = ["${var.region}a", "${var.region}b"] # ["us-east-1a", "us-east-1b"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = true
  enable_vpn_gateway = false
  enable_dns_support   = true 
  enable_dns_hostnames = true  
}
module "aws-alb-ecs" {
  source = "./modules/aws-alb-ecs"
  vpc_id              = module.vpc_module.vpc_id
  region              = var.region # "us-east-1"
  app_name            = var.app_name # "pokemon"
  container_port      = var.container_port # 5000
  container_image = var.container_image # "chenbello3/pokemon-flask-app:latest"

  public_subnet_1_id  = module.vpc_module.public_subnet_1_id
  public_subnet_2_id  = module.vpc_module.public_subnet_2_id
  private_subnet_1_id = module.vpc_module.private_subnet_1_id
  private_subnet_2_id = module.vpc_module.private_subnet_2_id
}