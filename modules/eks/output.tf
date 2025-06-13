output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "kubeconfig_certificate_authority" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}
