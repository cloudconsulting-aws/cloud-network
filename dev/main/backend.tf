terraform {
  backend "s3" {
    bucket       = "infras-terraform-tfstate"
    key          = "cloud-network/main/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
  required_version = "~> 1.10"
}