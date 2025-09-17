output "vpc_id" {
  value = module.vpc.vpc_id
}

output "azs" {
  value = module.vpc.azs
}

output "private_zones_map" {
  value = module.vpc.private_zones_map
}

output "public_subnets" {
  value = [
    module.vpc.public_subnet_az1_id,
    module.vpc.public_subnet_az2_id,
    module.vpc.public_subnet_az3_id,
  ]
}

output "private_subnets" {
  value = [
    module.vpc.private_subnet_az1_id,
    module.vpc.private_subnet_az2_id,
    module.vpc.private_subnet_az3_id,
  ]
}

output "public_subnet_az1_id" {
  value = module.vpc.public_subnet_az1_id
}

output "public_subnet_az2_id" {
  value = module.vpc.public_subnet_az2_id
}

output "public_subnet_az3_id" {
  value = module.vpc.public_subnet_az3_id
}

output "private_subnet_az1_id" {
  value = module.vpc.private_subnet_az1_id
}

output "private_subnet_az2_id" {
  value = module.vpc.private_subnet_az2_id
}

output "private_subnet_az3_id" {
  value = module.vpc.private_subnet_az3_id
}
