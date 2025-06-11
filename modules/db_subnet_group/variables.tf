
variable "name" {
  type    = string
  default = "my-db-subnet-group"
}

variable "description" {
  type    = string
  default = "subnetgroup of rdss"
}

variable "subnet_ids" {
  type = list(string)
  default = ["subnet-042bffecfb9a85ac9", "subnet-0c43c696d0a32cd99"]
  
}

variable "tags" {
  type = map(string)
  default = {
    Name        = "my-db-subnet-group"
    Environment = "production"
    Team        = "devops"
    Project     = "rds-mysql"
  }
}