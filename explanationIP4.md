

## 1️⃣ Introduction
This project automates the deployment of a containerized **E-commerce web application** with persistent MongoDB storage on **Google Kubernetes Engine (GKE)**. It is split into **two stages**.

---

## 2️⃣ Stage 1 – Ansible Automation
**Goal:** Configure and deploy the application on a provisioned VM using **Ansible**.

### Steps:
1. **Setup Ansible Roles**
   - **docker/**: Installs and configures Docker.
   - **mongodb/**: Installs MongoDB with persistent storage.
   - **app/**: Deploys the application containers.

2. **Inventory & Playbooks**
   - `inventory` file contains target hosts.
   - `playbook.yml` orchestrates role execution.

3. **Kubernetes Manifests**
   - Created manifests for the app and MongoDB.
   - Configured persistent volumes and services.

---

## 3️⃣ Stage 2 – Terraform + Ansible on GKE
**Goal:** Provision infrastructure on **GKE** and configure it with Ansible.

### Steps:
1. **Terraform Infrastructure**
   - Created `main.tf`, `variables.tf`, and `outputs.tf`.
   - Defined GKE cluster, node pool, and networking.
   - Used `terraform apply` to provision the cluster.

2. **Ansible Integration**
   - After provisioning, Ansible deploys the application to GKE.
   - Configures MongoDB with persistent volume claims.

3. **Deployment Validation**
   - Verified pods, services, and persistent volume claims.
   - Accessed the e-commerce application via the LoadBalancer IP.

---

## 4️⃣ Challenges & Solutions
| Challenge | Solution |
|-----------|----------|
| GKE authentication errors | Used `gcloud auth application-default login` |
| MongoDB persistence issues | Configured PVC and PV with appropriate storage class |
| CI/CD pipeline integration | Linked GKE deployment steps in Jenkins pipeline |

---

## 5️⃣ Results
- Failed to deployed app on GKE siting issues with the biling account which persisted.
- MongoDB data persists after pod restarts.
- Automated deployment workflow.

---

## 6️⃣ Commit Breakdown
The commits recorded show the incremental development of this project:
1. Repo structure setup.
2. VM provisioning with Vagrant.
3. Ansible Docker role creation.
4. MongoDB role with persistence.
5. Application deployment role.
6. Kubernetes manifests for GKE.
7. Terraform GKE scripts.
8. Terraform-Ansible integration.
9. Persistent MongoDB volume setup.
10. GKE cluster testing.
11. Documentation updates.
12. Cleanup and explanation.md added.

---

## 7️⃣ Conclusion
This project successfully demonstrated:
- Infrastructure provisioning with **Terraform**.
- Configuration management with **Ansible**.

- Data persistence in MongoDB.
- CI/CD integration with automated steps.
- personally i had a problem with accessing biling google console.
