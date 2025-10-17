# 🚀 Production Infrastructure on Azure with Terraform

This repository contains Terraform code for provisioning and managing a highly available, scalable Azure infrastructure. It follows a modular architecture, uses best practices for tagging, naming, and access control, and is fully version-controlled using Git.

---

## 🧱 Project Overview

This setup creates:

- 🖥️ **Azure Virtual Machine Scale Set (VMSS)** — Hosts the application
- ⚖️ **Load Balancer** — Distributes incoming traffic
- 🌐 **Virtual Network & Subnets** — Isolates and secures workloads
- 🔒 **Network Security Group (NSG)** — Defines inbound/outbound rules
- 📈 **Auto Scaling** — Dynamically adjusts VM instances
- 👥 **Entra ID Users** — With predefined Contributor and Reader roles
- 🏷️ **Resource Tags** — for cost and ownership tracking
- 🕒 **Git Tags** — to version-control Terraform code

---

## 📁 Project Structure
<img width="267" height="794" alt="image" src="https://github.com/user-attachments/assets/7f13e45b-6206-475f-81ef-58401f6904e1" />

# 🚀 Production Infrastructure Deployment Guide

This repository automates the provisioning of Azure infrastructure using **Terraform**.

---

## 1️⃣ Clone the Repository

git clone https://github.com/altamashn/Production_Infra.git

cd Production_Infra/Infrastructure

---

## 2️⃣ Initialize Terraform

terraform init

This will:
- Download Azure provider plugins
- Initialize backend configuration
- Prepare all modules for deployment

---

## 3️⃣ Validate and Format

terraform fmt -recursive

terraform validate

Ensures your code is properly formatted and syntactically correct.

---

## 4️⃣ Preview the Plan

terraform plan -var-file="terraform.tfvars"

See what Terraform will create before actual deployment.

---

## 5️⃣ Deploy the Infrastructure

terraform apply -var-file="terraform.tfvars" --auto-approve

Once confirmed, Terraform provisions all Azure resources.

---

## 6️⃣ Destroy Resources (if needed)

terraform destroy -var-file="terraform.tfvars"

Removes all provisioned resources cleanly.

---

## 🔐 Access Management

Two **Entra ID** users are created:

| User              | Role         |
|-------------------|-------------|
| 👨‍💻 DevOps User  | Contributor |
| 📊 Monitoring User| Reader      |

- Passwords are securely retrieved from **Azure Key Vault** via Terraform data blocks.

---

## 🌍 Application Access

Once deployed, open your Load Balancer public IP in the browser:

http://<public_ip>

text

You’ll see:

<img width="1365" height="407" alt="image" src="https://github.com/user-attachments/assets/49b8ddb3-ccb0-4a87-b946-3aa1e1802eca" />

---

## 👨‍💻 Author

**Altamash Jawed**  
Cloud & DevOps Engineer ☁️

- [LinkedIn](https://www.linkedin.com/in/altamash-jawed-62b6231b7)
- [GitHub](https://github.com/altamashn)
