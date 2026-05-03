terraform {
    backend "s3" {
    bucket = "devops-terraform-bucket-ap"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
    }
}