terraform {
  backend "s3" {
    bucket         = "tech-challenge-fast-food-terraform-state" # Substitua pelo nome do seu bucket S3
    key            = "rds/dev/terraform.tfstate"
    region         = "us-east-1" # Use a mesma região dos seus recursos
    encrypt        = true
    dynamodb_table = "tech-challenge-fast-food-terraform-locks" # Opcional, mas recomendado para bloqueio de estado
  }
}
