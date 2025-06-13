variable "name" {
  description = "Name prefix"
  type        = string
  default = "my-asg"
}

variable "ami_id" {
  description = "AMI ID to use"
  type        = string
  default = "ami-0f20bc7a567cdb626"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "desired_capacity" {
  type        = number
  default     = 2
}

variable "max_size" {
  type        = number
  default     = 2
}

variable "min_size" {
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for ASG"
  type        = list(string)
  default = ["subnet-042bffecfb9a85ac9", "subnet-0c43c696d0a32cd99" ]
}
