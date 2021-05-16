variable "vpc_prod" {
  type = string
  default = "vpc_prod"
}

variable "cluster_name" {
  type = string
  default = "cluster"
}

 variable "region" {
  type =  string
  default = "us-east-1"
}


variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
 }

variable "subn_private" {
  description = "subnets"
  type        = list 
  }
variable "subn_public" {
  description = "subnets"
  type        = list 
}
variable "cluster_version"{
   type = string
 }