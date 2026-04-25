resource "aws_iam_role" "this" {
  for_each = var.ec2_config

  name = each.value.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

# Adjuntar la primera política (AmazonSSMManagedInstanceCore)
resource "aws_iam_role_policy_attachment" "instance_policies" {
  for_each = var.ec2_config

  role       = aws_iam_role.this[each.key].name
  policy_arn = each.value.policy_arn
}

# Adjuntar la segunda política (CloudWatchAgentServerPolicy)
resource "aws_iam_role_policy_attachment" "instance_policies2" {
  for_each = var.ec2_config

  role       = aws_iam_role.this[each.key].name
  policy_arn = each.value.policy_arn1 # Asegúrate que policy_arn1 esté en variables.tf
}

resource "aws_iam_instance_profile" "this" {
  for_each = var.ec2_config

  name = "ec2_instance_profile-${each.value.role_name}"
  role = aws_iam_role.this[each.key].name
}