module "vpc" {
  source     = "../../../../../modules/aws/networking/vpc/"
  # vpc_cidr   = "10.0.0.0/16"
  # subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  # enable_nat = true
}
