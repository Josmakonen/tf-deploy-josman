/*output "instance_profile_name" {
  # Como el módulo usa for_each, cada 'instancia' del módulo tendrá su propio profile
  value = aws_iam_instance_profile.this[each.key].name
}*/

output "instance_profile_names" {
  value = { for k, v in aws_iam_instance_profile.this : k => v.name }
}