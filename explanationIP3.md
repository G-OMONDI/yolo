IP3 Configuration Management - Deployment with Ansible and Vagrant
This project automates the deployment of a containerized e-commerce dashboard using Vagrant and Ansible. The app consists of a MongoDB database, a Node.js backend API, and a React frontend.

Stack Summary
Vagrant: Provisions an Ubuntu 20.04 (Jeff Geerlings ubuntu 20.04) virtual machine (VM).
Ansible: Automates container creation and deployment.
MongoDB: Stores the application's data.
Project Structure
project-root/
├── Vagrantfile
├── playbook.yml
├── roles/
│ ├── mongodb/
│ │ └── tasks/
│ │ └── main.yml
│ ├── frontend/
│ │ └── tasks/
│ │ └── main.yml
│ └── backend/
│ └── tasks/
│ └── main.yml
├── yolo/
│ ├── backend/ # Node.js backend
│ └── client/ # React frontend
Vagrantfile setup
The Vagrantfile defines the VM configuration and triggers Ansible provisioning

Vagrant Box:
     "config.vm.box = "geerlingguy/ubuntu2004"" 
Network:

    config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"
    config.vm.network "forwarded_port", guest: 5000, host: 5000, host_ip: "127.0.0.1"
    config.vm.network "forwarded_port", guest: 27017, host: 27017, host_ip: "127.0.0.1"
Maps vagrant VM ports (3000, 5000, 27017) to host ports to enable access

Ansible Provisioner:
 config.vm.synced_folder ".", "/home/vagrant/yolo"

 config.vm.provision "ansible" do |ansible|
 ansible.playbook = "playbook.yml"
 
#ansible.verbose = "vvv"
end
Executes <playbook.yaml> to provision the VM

Playbook setup
Play 1. Clone yolo project repository

This play ensures the target machine is ready by installing Git and cloning the source code for the e-commerce project. It's a setup step before deploying the app (MongoDB, frontend, backend).

Play 2. Ensure Docker Network Exists

- name: Ensure Docker network exists
  hosts: all
  become: true
  tasks:
    - name: Create Docker network app-net
      community.docker.docker_network:
        name: app-net
        state: present
Target all hosts (<hosts: all>)

Use <become: true> → Run commands as root

Create a Docker network named using the <community.docker.docker_network> module

If it doesn’t exist, Ansible creates it

If it already exists, Ansible does nothing

Play 3 Run Role-Based Deployments

    - name: IP3 Ansible playbook
  hosts: all
  become: true
  roles: 
    - mongodb
    - frontend
    - backend
Target all hosts again

Use <become: true> for root access

Apply the following Ansible roles in order:

mongodb: deploys MongoDB container

frontend: deploys the frontend container (React)

backend: deploys the backend container (Node.js)

Result
A Docker network is created for communication between containers

MongoDB, backend, and frontend services are each deployed in their own containers

All containers are attached to , enabling them to talk to each other

