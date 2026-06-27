data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  az_1 = data.aws_availability_zones.available.names[0] 
  az_2 = data.aws_availability_zones.available.names[1] 
}