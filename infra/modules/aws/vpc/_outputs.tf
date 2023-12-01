output "load_balancer_ip" {
  value = aws_lb.aws_infra.dns_name
}

output "target_group" {
  value = aws_lb_target_group.aws_infra.id
}

output "subnet_ids_private" {
  value = aws_subnet.private[*].id
}

output "subnet_ids_public" {
  value = aws_subnet.public[*].id
}

# output "security_group_ecs_task" {
#   value = aws_security_group.aws_infra_ecs_task.id
# }
