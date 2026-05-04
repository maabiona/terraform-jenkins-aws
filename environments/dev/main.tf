provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "dev-vpc"
}

module "sg" {
  source = "../../modules/security_groups"
  name   = "jenkins-sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "../../modules/ec2"
  instance_type     = "t3.micro"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.sg.security_group_id
  key_name          = "tehilla-keypair-jenkins"
  name              = "tehilla-keypair-jenkins"
}

output "jenkins_public_ip" {
  value = module.ec2.public_ip
}
