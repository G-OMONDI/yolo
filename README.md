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

git clone https://github.com/your-username/yolo.git
cd yolo


# Build and run all containers
docker-compose up --build

🔗 Docker Hub Repositories(https://hub.docker.com/repositories/glen510)
geoffrey-yolo-client

geoffrey-yolo-backend

![DockerHub Screenshot](dockerhub-screenshot.png)


# 🛠️ Stage 1: Ansible-based E-commerce App Deployment

## 📦 Description
This project automates the deployment of a containerized e-commerce application using Ansible and Docker, provisioned inside a Vagrant-based Ubuntu VM.

## 🧰 Tools Used
- Ansible
- Docker
- Vagrant
- Ubuntu 20.04

## 🚀 Setup Instructions

```bash
# Start VM
vagrant up

# SSH into VM
vagrant ssh

# Run playbook
ansible-playbook /vagrant/playbook.yml

# DevOps Final Assignment

## Stage 1 (Ansible + Vagrant)
- `vagrant up` creates a VM.
- Ansible installs Docker, Docker Compose, and runs the app.
- Follows best practices (roles + variables).

## Stage 2 (Terraform + Ansible)
- Terraform generates inventory, triggers Ansible.
- Ansible sets up services and launches Dockerized app.
- Infrastructure and configuration are fully automated.

## Application URL
- http://192.168.56.10:PORT

# 🚀 Stage Two – DevOps Project Deployment (Terraform + Docker)

## 📌 Overview

This document outlines the **Stage Two** implementation of the DevOps project. In this stage, we added infrastructure provisioning using **Terraform**, integrated it with Docker containers, and ensured clean DevOps practices such as modular code, parameterization, and Git versioning via a second branch.

---

## 🛠️ Branching Strategy

To separate Stage One from Stage Two, a new Git branch was created:

```bash
git checkout -b stage_two
 Project Structure
project-root/
├── backend/ # Node.js backend
│ └── Dockerfile
├── client/ # React frontend
│ └── Dockerfile
├── docker-compose.yml # Manual orchestration
├── Vagrantfile # VM provisioning
├── playbook.yml # Main Ansible playbook
├── roles/ # Ansible roles
│ ├── mongodb/
│ ├── backend/
│ └── frontend/
├── explanationIP2.md 
├── explanationIP3.md
└── README.md 
Documentation
IP 2 Creating a Basic Micro-service - Explanation of steps undertaken to create a Basic Micro-service

IP 3 Configuration Management - IP3 Configuration Management - Deployment with Ansible and Vagrant





