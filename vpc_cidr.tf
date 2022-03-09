data "aws_vpc" "prod" {
  filter {
    name   = "tag:Name"
    values = ["dev"]
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.prod.id

  tags = {
    Type = "Private*"
  }
}

#get ipv4 CIDR
cidrsubnet(data.aws_vpc.prod.cidr_block, 4, 2)

#get subnets
data.aws_subnet_ids.private.ids
