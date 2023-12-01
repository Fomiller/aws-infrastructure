resource "aws_eks_cluster" "cluster" {
  name     = "${var.namespace}-cluster"
  role_arn = var.iam_role_arn_eks_cluster

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]

    subnet_ids = concat(var.subnet_ids_private, var.subnet_ids_public)
  }

}

resource "aws_eks_fargate_profile" "fomiller" {
  cluster_name           = aws_eks_cluster.cluster.name
  fargate_profile_name   = var.namespace
  pod_execution_role_arn = var.iam_role_arn_eks_fargate_profile

  selector {
    namespace = var.namespace #this might need to be moved to chat-stat repo
  }
}