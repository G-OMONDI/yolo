# main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_net" {
  name   = "app-net"
  driver = "bridge"
}

resource "docker_volume" "mongo_data" {
  name = "mongo-data"
}

resource "docker_image" "mongo" {
  name = var.mongo_image
}

resource "docker_container" "mongo" {
  name  = var.mongo_container_name
  image = docker_image.mongo.name

  ports {
    internal = var.mongo_port
    external = var.mongo_port
  }

  volumes {
    volume_name    = docker_volume.mongo_data.name
    container_path = "/bitnami/mongodb"
  }

  env = [
    "MONGODB_ROOT_PASSWORD=${var.mongo_root_password}",
    "MONGODB_USERNAME=${var.mongo_user}",
    "MONGODB_PASSWORD=${var.mongo_password}",
    "MONGO_URL=${var.mongo_url}"
  ]

  networks_advanced {
    name = docker_network.app_net.name
  }
}

resource "docker_image" "backend" {
  name = var.backend_image
}

resource "docker_container" "backend" {
  name  = var.backend_container_name
  image = docker_image.backend.name
  depends_on = [docker_container.mongo]

  ports {
    internal = var.backend_port
    external = var.backend_port
  }

  env = [
    "MONGO_URL=mongodb://mongo:27017/yolo_db"
  ]

  networks_advanced {
    name = docker_network.app_net.name
  }
}

resource "docker_image" "client" {
  name = var.client_image
}

resource "docker_container" "client" {
  name  = var.client_container_name
  image = docker_image.client.name
  depends_on = [docker_container.backend]

  ports {
    internal = 80
    external = var.client_port
  }

  networks_advanced {
    name = docker_network.app_net.name
  }
}
