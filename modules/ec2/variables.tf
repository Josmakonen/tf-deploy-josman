variable "ec2_config" {
  description = "Configuración de las instancias EC2"
  type = map(object({
    role_name         = string
    ami               = string
    instance_type     = string
    subnet_id         = string # Corregido: en su propia línea
    tagsec2           = map(string)
    policy_arn        = string
    root_block_device = object({
      volume_size = number
      volume_type = string
      iops        = number
    })
  }))
}

variable "security_group_ids" {
  type = list(string)
}

variable "iam_instance_profile" {
  type = string
}
variable "tags" {
  description = "Tags globales para los recursos"
  type        = map(string)
}

/*variable "security_group_ids" {
  description = "Mapa de IDs de los grupos de seguridad"
  type        = map(string) # Coincide con tu main.tf: var.security_group_ids[each.key]
}*/

variable "key_name" {
  description = "Nombre del keypair"
  type        = string
}

variable "private_key_path" {
  description = "Ruta donde se guardará el archivo .pem local"
  type        = string
}

variable "iam_instance_profiles" {
  description = "Mapa de los nombres de perfiles de instancia iam"
  type        = map(string) # Coincide con tu main.tf: var.iam_instance_profiles[each.key]
}