# Explanation: Automated Deployment with Ansible and Vagrant

This document explains how to automate the deployment of a containerized e-commerce dashboard using Vagrant and Ansible. The application stack includes a MongoDB database, a Node.js backend API, and a React frontend.

## Stack Overview

- **Vagrant**: Provisions an Ubuntu 20.04 virtual machine (using the `geerlingguy/ubuntu2004` box).
- **Ansible**: Automates the creation and deployment of containers.
- **MongoDB**: Stores application data.

## Project Structure

```
project-root/
├── Vagrantfile
├── playbook.yml
├── roles/
│   ├── mongodb/
│   │   └── tasks/
│   │       └── main.yml
│   ├── frontend/
│   │   └── tasks/
│   │       └── main.yml
│   └── backend/
│       └── tasks/
│           └── main.yml
├── yolo/
│   ├── backend/   # Node.js backend
│   └── client/    # React frontend
```

## Vagrantfile Configuration

- **Box**: Uses `geerlingguy/ubuntu2004`.
- **Networking**: Forwards ports 3000 (frontend), 5000 (backend), and 27017 (MongoDB) from the VM to the host.
- **Synced Folder**: Maps the project directory to `/home/vagrant/yolo` in the VM.
- **Provisioning**: Runs Ansible with `playbook.yml` to automate setup.

## Ansible Playbook Breakdown

### 1. Clone Project Repository

Installs Git and clones the e-commerce project source code onto the VM. This prepares the environment for deployment.

### 2. Ensure Docker Network Exists

Creates a Docker network (`app-net`) using the `community.docker.docker_network` module. If the network already exists, this step is skipped.

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

### 3. Deploy Application Roles

Applies three Ansible roles to deploy each service as a Docker container:

- **mongodb**: Deploys the MongoDB container.
- **frontend**: Deploys the React frontend container.
- **backend**: Deploys the Node.js backend container.

All containers are attached to the `app-net` Docker network for internal communication.

## Result

- A dedicated Docker network enables seamless communication between containers.
- MongoDB, backend, and frontend services run in isolated containers.
- The setup is fully automated and reproducible using Vagrant and Ansible.


