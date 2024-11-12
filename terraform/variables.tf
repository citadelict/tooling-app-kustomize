variable "db_instance_class" {
  default = "db.r7g.large"
}

variable "db_name" {
  default = "tooling_db"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = ""
  sensitive = true
}

variable "vpc_id" {
  default = "vpc-0e65f071d86a07a0c"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for Aurora cluster"
  type        = list(string)
  default     = ["subnet-0f78d1558d12f5798", "subnet-08795fae9110802f6"]  
}