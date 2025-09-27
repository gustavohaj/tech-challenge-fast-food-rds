terraform {
  backend "s3" {
    bucket         = "tech-challenge-fast-food-terraform-state" 
    key            = "environments/rds-dev/terraform.tfstate"
    region         = "us-east-1" 
    encrypt        = true
    dynamodb_table = "tech-challenge-fast-food-terraform-locks" 
  }
}