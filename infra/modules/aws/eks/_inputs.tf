variable "iam_role_arn_eks_cluster" { type = string }
variable "iam_role_arn_eks_node_groups" { type = string }
variable "subnet_ids_private" { type = list(string) }
variable "subnet_ids_public" { type = list(string) }
variable "vpc_id" { type = string }
variable "security_group_id_eks" { type = string }
variable "kms_key_arn_master" { type = string }
