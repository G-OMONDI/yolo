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

🔗 Docker Hub Repositories(https://hub.docker.com/repositories/glen510-yolo-client

glen510-yolo-backend0)

![DockerHub Screenshot](dockerhub-screenshot.png)


Here is a clean, personalized version of your `explanation.md` for **IP3 Configuration Management - Deployment with Ansible and Vagrant**, based on your setup and contributions:

---

# 📦 IP3 Configuration Management – Deployment with Ansible and Vagrant

## 🔍 Project Overview

This independent project automates the deployment of a containerized e-commerce dashboard using **Vagrant** and **Ansible**. The application consists of three components:

* **MongoDB** – NoSQL database for storing product data.
* **Backend** – Node.js API service.
* **Frontend** – React-based user interface.

All components are deployed as Docker containers on a provisioned Ubuntu 20.04 virtual machine using **Ansible roles** for modular automation.

---

## 🧰 Tech Stack Summary

| Tool    | Purpose                               |
| ------- | ------------------------------------- |
| Vagrant | Provisions Ubuntu VM using VirtualBox |
| Ansible | Automates app deployment via roles    |
| Docker  | Runs MongoDB, backend, and frontend   |
| MongoDB | Stores application data persistently  |
| Node.js | Backend API service                   |
| React   | Frontend UI                           |

---

## 📁 Project Structure

```bash
project-root/
├── Vagrantfile
├── playbook.yml
├── roles/
│   ├── mongodb/
│   │   └── tasks/main.yml
│   ├── frontend/
│   │   └── tasks/main.yml
│   └── backend/
│       └── tasks/main.yml
├── terraform/                  # (For Stage 2)
├── yolo/
│   ├── backend/                # Node.js backend
│   └── client/                 # React frontend
├── explanation.md
└── README.md
```

---

## 🛠️ Vagrant Setup

The `Vagrantfile` provisions a VM using `geerlingguy/ubuntu2004`, sets up port forwarding, and triggers Ansible provisioning:

### ⚙️ Vagrant Configuration

```ruby
config.vm.box = "geerlingguy/ubuntu2004"

config.vm.network "forwarded_port", guest: 3000, host: 3000
config.vm.network "forwarded_port", guest: 5000, host: 5000
config.vm.network "forwarded_port", guest: 27017, host: 27017

config.vm.synced_folder ".", "/home/vagrant/yolo"

config.vm.provision "ansible" do |ansible|
  ansible.playbook = "playbook.yml"
end
```

---

## 📋 Ansible Playbook Breakdown

### 🎯 Play 1: Clone Project

Ensures Git is installed and the latest version of the e-commerce app is cloned into the VM.

### 🛠️ Play 2: Create Docker Network

Creates a Docker bridge network (`app-net`) to enable communication between MongoDB, backend, and frontend containers.

```yaml
- name: Ensure Docker network exists
  hosts: all
  become: true
  tasks:
    - name: Create Docker network app-net
      community.docker.docker_network:
        name: app-net
        state: present
```

### 📦 Play 3: Deploy with Ansible Roles

Roles are used for modular deployment of the containers:

```yaml
roles:
  - mongodb
  - backend
  - frontend
```

---

## 🔄 Docker Containers Deployed

| Container Name     | Image                          | Function       |
| ------------------ | ------------------------------ | -------------- |
| mongodb\_container | `mongo`                        | NoSQL Database |
| yolo-backend       | `glen510/yolo-backend:v1.0.0`  | Node.js API    |
| yolofrontend       | `glen510/yolo-frontend:v1.0.0` | React UI       |

All containers are connected via the `app-net` Docker network.

---

## 💾 Persistence Configuration

MongoDB is configured with a persistent volume:

```yaml
volumes:
  - yolo_mongo_data:/data/db
```

This ensures product data is **not lost** across container restarts.

---

## 🚀 Deployment Steps

### 1️⃣ Provision the VM

```bash
vagrant up
```

### 2️⃣ SSH into the VM

```bash
vagrant ssh
```

### 3️⃣ Execute Ansible Playbook

```bash
ansible-playbook playbook.yml
```

---

## 🌐 Access Points

| Component | URL                                            |
| --------- | ---------------------------------------------- |
| Frontend  | [http://localhost:3000](http://localhost:3000) |
| Backend   | [http://localhost:5000](http://localhost:5000) |
| MongoDB   | localhost:27017                                |

---

## 🧠 Git Workflow & Commits

Below are descriptive commit messages used throughout the project to track meaningful changes:

```bash
git commit -m "deleted original files that existed to allow me create mine"
git commit -m "Created new vagrantfile"
git commit -m "define the roles that will be provisioned"
git commit -m "create tasks under roles for each container and database"
git commit -m "add tasks to the playbook to be executed under roles"
git commit -m "create a task to provision MongoDB database container"
git commit -m "define ansible role that spins up the MongoDB container"
git commit -m "define ansible role that spins up the frontend and backend containers"
git commit -m "add persistency to ensure that the uploaded products are not lost when restarted"
git commit -m "Add screenshot of results from various stages"
```

---

## 📝 Conclusion

This project demonstrated the automation of a full-stack e-commerce application deployment using Ansible and Vagrant. The approach followed DevOps best practices including:

* Modular Ansible roles
* Persistent data handling
* Docker container orchestration
* Clean VM provisioning

---


