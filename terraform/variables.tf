variable "mongo_port" {
  description = "MongoDB exposed port"
  default     = 27017
}

variable "backend_port" {
  description = "Backend exposed port"
  default     = 5000
}

variable "frontend_port" {
  description = "Frontend exposed port"
  default     = 3000
}
