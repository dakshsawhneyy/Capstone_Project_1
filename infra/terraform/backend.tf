terraform {
  backend "s3" {
    bucket         = "daksh-capstone-statefile"
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}