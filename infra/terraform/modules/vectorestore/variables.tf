variable "vpc_id" {
  type        = string
  description = "id of the vpc to create RDS DB in"
}

variable "subnet_ids" {
  type = list(string)
  description = "id to place the RDS DB in"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be added to all the resources"
  default     = {}
}
