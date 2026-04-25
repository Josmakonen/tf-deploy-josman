module "module_security_group" {
  source    = "./modules/security_group"
  sg_config = var.sg_config
  tags      = var.tags
  project   = var.proyecto
  account   = var.cuenta
  vpc_id    = var.vpc_id
}


module "module_iam_config" {
  source     = "./modules/iam"
  ec2_config = var.ec2_config
  project    = var.proyecto
  account    = var.cuenta
}




module "module_ec2_instances" {
  source = "./modules/ec2"
  /*security_group_ids    = module.module_security_group.security_group_ids*/
  security_group_ids    = values(module.module_security_group.security_group_ids)
  iam_instance_profiles = module.module_iam_config.instance_profile_names
  ec2_config            = var.ec2_config
  key_name              = var.key_name
  private_key_path      = var.private_key_path
  tags                  = var.tags
  for_each              = var.ec2_config
  /*iam_instance_profile  = module.module_iam_config.instance_profile_names*/
  /*iam_instance_profile = module.module_iam_instance_profile_names*/
  /*iam_instance_profile = module.module_iam_config.instance_profile_names*/
  iam_instance_profile = module.module_iam_config.instance_profile_names[each.key]
}

