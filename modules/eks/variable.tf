variable "cluster_name" {
    type = string
    description = "this is a demo eks cluster"
    default = "dev-eks-cluster"
}
variable "kubernetes_version" {
    type = string
  default = "1.29"
}
variable "subnet_ids" {
  type = list(string)
  default = [ "subnet-042bffecfb9a85ac9", "subnet-0c43c696d0a32cd99" ]
}
variable "desired_size" {
    type = number
  default = 2
}
variable "max_size" {
    type = number
  default = 2
}
variable "min_size" {
    type = number
  default = 1
}
variable "instance_types" {
  type    = list(string)
  default = ["t2.medium"]
}
