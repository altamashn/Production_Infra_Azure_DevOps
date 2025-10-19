# 🌐 Production-Level Azure Infrastructure with Terraform & Azure DevOps

This repository contains infrastructure-as-code (IaC) to provision and manage **production-grade Azure resources** using **Terraform**, automated via **Azure DevOps CI/CD pipelines**.

---

## 🚀 Project Overview

This setup is designed to ensure **secure, automated, and auditable** provisioning of Azure resources, following DevOps best practices.

- 📦 **Infrastructure as Code (IaC)**: Written in Terraform and organized under the `/Infrastructure` directory.
- ⚙️ **CI/CD Pipeline**: Implemented via GitHub Actions to automate validation, planning, and deployment.
- 🔐 **Branch Protection**: Prevents direct pushes to `master`; all changes must go through Pull Requests (PRs).
- 👥 **Approval Workflow**: Enforces peer review before infrastructure is deployed.

---

## 🔁 CI/CD Workflow Overview

### ✅ 1. **Feature Branch Workflow**

- A **DevOps engineer** creates or updates a `feature/*` branch.
- GitHub Actions automatically triggers the **Validate & Plan** stage:
  - `terraform init`
  - `terraform validate`
  - `terraform fmt`
  - `terraform plan`
- This ensures all changes are valid and no infrastructure drift occurs before PR creation.

### 🛡️ 2. **Pull Request (PR) Review**

- A pull request is opened to merge `feature/*` into `master`.
- **Branch protection rules** require:
  - At least one approving reviewer
  - All checks (validation) to pass
- Once approved, the code is merged into `master`.

### 🚀 3. **Deploy to Production (Main Branch)**

- Once changes are merged to `master`, the **Deploy** job is triggered:
  - `terraform init` (with remote backend config)
  - `terraform plan`
  - `terraform apply`
- Azure infrastructure is provisioned or updated accordingly.

---

## 🔐 Security & Governance

- **Branch Protection**: `master` branch is protected. No direct pushes allowed. All changes must go through PR + review.
- **State Management**: Terraform remote backend is configured using an Azure Storage Account to ensure consistent, safe state storage.

---

## 🧪 Pipeline Summary

| Event               | Trigger                   | Action                                  |
|--------------------|---------------------------|----------------------------------------- |
| Push to feature/*  | `push` event              | Run `validate`, `init , `fmt`, `plan`   |
| PR to main         | `pull_request` event      | Reviewer approval required               |
| Merge to main      | `push` to `main`          | Run `init`, `plan`, `apply`              |

---

## 📄 Requirements

- Azure Subscription
- Azure Service Principal with appropriate role (`Contributor` or scoped role)
- Azure repository with Variable-Groups:
  - Variables: `RESOURCE_GROUP_NAME`, `STORAGE_ACCOUNT_NAME`, `CONTAINER_NAME`, `KEY`

---

## 📘 Setup Instructions

1. **Clone the repo**  
   ```bash
   
   git clone https://github.com/altamashn/Production_Infra_Azure_DevOps.git
   
   cd Production_Infra_Azure_DevOps
   
2. **Configure Terraform backend in backend.tf using variables.****

3. **Push changes to a feature branch**

    git checkout -b feature/my-change
   
    git push origin feature/my-change

5. **Open a pull request and request a review.**

6. **Once approved and merged to master, the infrastructure will be deployed automatically.**

---

## 👨‍💻 Author

**Altamash Jawed**  
Cloud & DevOps Engineer ☁️

- [LinkedIn](https://www.linkedin.com/in/altamash-jawed-62b6231b7)
- [GitHub](https://github.com/altamashn)
