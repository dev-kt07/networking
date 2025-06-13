
provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = "10.1.0.0/16"
  public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets    = ["10.1.101.0/24", "10.1.102.0/24"]
  availability_zones = ["us-east-2a", "us-east-2b"]
}


module "db_subnet_group" {
  source      = "./modules/db_subnet_group"
  name        = "my-db-subnet-group"
  description = "Subnet group for RDS"

  subnet_ids = ["subnet-042bffecfb9a85ac9", "subnet-0c43c696d0a32cd99"]
  
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = "dev-eks-cluster"
  subnet_ids         = module.vpc.private_subnets
  kubernetes_version = "1.29"

  desired_size   = 2
  min_size       = 1
  max_size       = 2
  instance_types = ["t2.medium"]
}

module "security_group" {
  source      = "./modules/security_group"
  name        = "my-custom-sg"
  description = "Security group for my app"
  vpc_id      =	"vpc-0af2e27359957c8f0"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTPS from anywhere
  }
  ]


  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}


module "asg" {
  source            = "./modules/asg"
  name              = "my-asg"
  ami_id            = "ami-0f20bc7a567cdb626"
  instance_type     = "t2.micro"
  desired_capacity  = 2
  max_size          = 2
  min_size          = 1
  subnet_ids        = ["subnet-042bffecfb9a85ac9", "subnet-0c43c696d0a32cd99"]
}

