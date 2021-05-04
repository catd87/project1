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
  default = "us-west-2"
}
variable "az_usw" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b",  "us-west-2c"]
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "subn_private" {
  description = "subnets"
  type        = list 
  default     = ["192.168.1.0/24", "192.168.2.0/24"]
}
variable "subn_public" {
  description = "subnets"
  type        = list 
  default     = ["192.168.101.0/24", "192.168.102.0/24"]
}
variable "cluster_version"{
   type = string
   default = "1.17" 
}