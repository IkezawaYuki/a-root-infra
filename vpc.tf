
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"
  name    = "a-root"

  cidr = "10.0.0.0/16"

  azs = slice(data.aws_availability_zones.available.names, 0, 2)

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

data "aws_availability_zones" "available" {}


# 00001010 00000000 00000000 00000000

# 00001010 00000000 00000001 00000000
# 00001010 00000000 00000002 00000000
# 00001010 00000000 00000003 00000000
# 00001010 00000000 00000004 00000000

