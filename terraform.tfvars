cuenta           = "cuenta"
proyecto         = "proyecto"
key_name         = "nombrekeypair"
private_key_path = "./nombrekeypair.pem"
vpc_id           = "vpc-00f479057476a2db8"
tags = {
  "tag1" = "valor"


}


ec2_config = {
  instance_1 = {
    role_name     = "nombredelrolacrear"
    ami           = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro"
    subnet_id     = "subnet-076d9f2982b7f4173"
    policy_arn    = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    policy_arn1   = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
    tagsec2 = {
      Name     = "tags"
      "a-tag1" = "tags"
    }




    root_block_device = {
      volume_size = 80
      volume_type = "gp3"
      iops        = 3000
    }


  }
}


sg_config = {
  instance_1 = {
    name                 = "ause1-sg-final-josemanuel"
    description          = "Descripcion para grupo de seguridad"
    vpc_id               = "vpc-00f479057476a2db8"
    projectsecuritygroup = "sgproyect"
    ingress_rules = [
      { from_port = 3389, to_port = 3389, protocol = "tcp", cidr_blocks = ["10.0.0.0/8"] },
      { from_port = 0, to_port = 65535, protocol = "tcp", cidr_blocks = ["10.215.3.51/32"] }
    ]
  }
}
