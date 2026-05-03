variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "cluster_name" {
  default = "devops-eks"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}