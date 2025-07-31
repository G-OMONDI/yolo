Here's a customized and clean version of your `explanation.md` file for **IP3 Configuration Management - Deployment with Ansible and Vagrant**, rewritten as your own work, using your tools and project structure.

---

# **IP3 Configuration Management - E-commerce App Deployment**

This project automates the deployment of a containerized e-commerce dashboard using **Vagrant** for virtual machine provisioning and **Ansible** for container orchestration. It builds upon the previous containerization project by introducing configuration management tools for improved infrastructure automation.

---

## 🔧 **Technology Stack**

| Tool        | Purpose                                                |
| ----------- | ------------------------------------------------------ |
| **Vagrant** | Provisions Ubuntu 20.04 VM using a Vagrantfile         |
| **Ansible** | Automates Docker installation and container deployment |
| **MongoDB** | Stores application product data (with persistence)     |
| **Node.js** | Backend API for the app                                |
| **React**   | Frontend UI for the e-commerce dashboard               |

---

## 📁 **Project Structure**

```plaintext
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
├── terraform/           # Stage 2 for infrastructure provisioning
│   └── ...              # Terraform config files
├── yolo/
│   ├── backend/         # Node.js backend code
│   └── client/          # React frontend code
```

---

## 📦 **Vagrant Configuration**

Defined in `Vagrantfile`:

```ruby
config.vm.box = "geerlingguy/ubuntu2004"
config.vm.synced_folder ".", "/home/vagrant/yolo"

# Port Forwarding
config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"
config.vm.network "forwarded_port", guest: 5000, host: 5000, host_ip: "127.0.0.1"
config.vm.network "forwarded_port", guest: 27017, host: 27017, host_ip: "127.0.0.1"

# Ansible Provisioning
config.vm.provision "ansible" do |ansible|
  ansible.playbook = "playbook.yml"
end
```

---

## 🧩 **Ansible Playbook Overview**

### **Play 1: Clone Repository**

Ensures Git is installed and the e-commerce codebase is available.

### **Play 2: Create Docker Network**

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

### **Play 3: Deploy MongoDB, Frontend, and Backend**

```yaml
- name: Deploy E-commerce App
  hosts: all
  become: true
  roles:
    - mongodb
    - frontend
    - backend
```

---

## 📌 **Role Details**

### **1. MongoDB Role (`roles/mongodb/tasks/main.yml`)**

* Uses the official `mongo` image
* Attaches volume for persistence
* Connected to `app-net`

```yaml
- name: Run MongoDB container
  community.docker.docker_container:
    name: mongodb_container
    image: mongo
    state: started
    restart_policy: always
    networks:
      - name: app-net
    volumes:
      - yolo_mongo_data:/data/db
```

---

### **2. Backend Role (`roles/backend/tasks/main.yml`)**

* Pulls backend image from DockerHub
* Exposes port `5000`
* Connects to `app-net`

---

### **3. Frontend Role (`roles/frontend/tasks/main.yml`)**

* Pulls frontend image from DockerHub
* Exposes port `3000`
* Connects to `app-net`

---

## 🧪 **Deployment Steps**

### **1. Provision the VM**

```bash
vagrant up
```

### **2. SSH into the VM**

```bash
vagrant ssh
```

### **3. Run the Ansible Playbook**

```bash
ansible-playbook playbook.yml
```

---

## 🌐 **Access Points**

| Component | URL                                            |
| --------- | ---------------------------------------------- |
| Frontend  | [http://localhost:3000](http://localhost:3000) |
| Backend   | [http://localhost:5000](http://localhost:5000) |
| MongoDB   | localhost:27017 (internal)                     |

---

## 📦 **Docker Containers Summary**

| Name               | Image                         | Purpose        |
| ------------------ | ----------------------------- | -------------- |
| mongodb\_container | mongo                         | NoSQL Database |
| yolo-backend       | glen510/yolo-backend\:v1.0.0  | Backend API    |
| yolo-frontend      | glen510/yolo-frontend\:v1.0.0 | React UI       |

---

## 💾 **Data Persistence**

* MongoDB uses a named Docker volume: `yolo_mongo_data`
* Ensures data such as products are not lost when container restarts

---

## 🌲 **Git Workflow Summary**

Example commits:

```bash
git commit -m "Deleted default files and created project structure"
git commit -m "Defined Ansible roles for MongoDB, frontend, and backend"
git commit -m "Implemented persistent MongoDB volume"
git commit -m "Provisioned frontend and backend Docker containers"
git commit -m "Completed IP3 project with working deployment"
```

---

## 🌍 **Stage 2: Terraform Integration**

* Added `terraform/` folder with infrastructure-as-code setup
* Terraform provisions cloud-ready VMs and networks
* Ansible connects to Terraform output and deploys the same container setup
* Enhances scalability and cloud readiness

---

