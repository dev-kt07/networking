
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