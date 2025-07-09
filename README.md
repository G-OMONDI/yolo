# 🛒 YOLO E-Commerce Platform (Dockerized)

A full-stack e-commerce platform built with React (frontend), Node.js/Express (backend), and MongoDB (database) — fully containerized using Docker and orchestrated with Docker Compose.

---

## 🚀 Features

- Add/view retail products
- Full microservice architecture
- MongoDB persistence via named volumes
- Lightweight production builds using Alpine images
- Tagged DockerHub images (SemVer: v1.0.0)
- Custom Docker bridge network

---

## 🧱 Technology Stack

| Layer     | Tech              |
|-----------|-------------------|
| Frontend  | React + Nginx     |
| Backend   | Node.js + Express |
| Database  | MongoDB           |
| Runtime   | Docker + Compose  |

---

## 🐳 DockerHub Images

| Service   | Image |
|-----------|-------|
| Frontend  | [`glen510/yolo-client:v1.0.0`](https://hub.docker.com/repository/docker/glen510/yolo-backend) |
| Backend   | [`glen510/yolo-backend:v1.0.0`](https://hub.docker.com/repository/docker/glen510/yolo-client) |
