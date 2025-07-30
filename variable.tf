# variables.tf

variable "mongo_image" {
  default = "bitnami/mongodb:6.0"
}

variable "mongo_container_name" {
  default = "yolo-mongo-stage2"
}

variable "mongo_port" {
  default = 27017
}

variable "mongo_root_password" {
  default = "your_root_password"
}

variable "mongo_user" {
  default = "your_user"
}

variable "mongo_password" {
  default = "your_password"
}

variable "mongo_url" {
  default = "mongodb://your_user:your_password@mongo:27017/yolo_db?authSource=admin"
}

variable "backend_image" {
  default = "glen510/yolo-backend:v1.0.0"
}

variable "backend_container_name" {
  default = "yolo-backend"
}

variable "backend_port" {
  default = 5000
}

variable "client_image" {
  default = "glen510/yolo-client:v1.0.0"
}

variable "client_container_name" {
  default = "yolo-client"
}

variable "client_port" {
  default = 3000
}
