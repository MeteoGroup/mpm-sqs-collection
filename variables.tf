variable "prefix" {
  type        = "string"
  description = "Prefix for the SQS"
}

variable "project" {
  type        = "string"
  description = "Project name for the SQS"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags  (e.g. map(`BusinessUnit`,`XYZ`)"
}
