variable "region" {
  description = "Main region for all resources"
  type        = string
}


variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "A list of public subnets CIDRs."
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets" {
  description = "A list of private subnets CIDRs."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "cluster_name" {
  description = "The name of the ECS cluster."
  type        = string
  default     = "poke-cluster"
}


variable "app_name" {
  type        = string
  description = "Name of the application"
  default     = "pokemon"
}

variable "container_image" {
  type        = string
  description = "Docker image to run"
  default     = "chenbello3/pokemon-flask-app:latest"
}

variable "container_port" {
  type        = number
  description = "Port the container listens on"
  default     = 80
}

# variable "default_tags" {
#   type = map(string)
#   description = "Default tags to apply to resources"
#   default = {
#     Terraform   = "true"
#     Application = "Pokemon App"
#     Environment = "Dev"
#   }
# }
