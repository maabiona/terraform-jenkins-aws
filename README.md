# AWS DevOps CI/CD Pipeline with Terraform & Jenkins

## Project Overview

This project demonstrates how to provision and manage a complete CI/CD infrastructure on AWS using Terraform and Jenkins.

The goal is to showcase real-world DevOps skills including Infrastructure as Code (IaC), cloud networking, automation, and system troubleshooting.

---

## Architecture

The infrastructure consists of:

* Custom VPC with public subnet
* Internet Gateway for external access
* Security Groups for controlled access (SSH & Jenkins)
* EC2 instance hosting Jenkins
* Elastic IP for stable public access
* Automated Jenkins installation via bootstrap script

---

## Tech Stack

* Cloud Provider: AWS
* Infrastructure as Code: Terraform
* CI/CD Tool: Jenkins
* Operating System: Ubuntu (EC2-->t3 micro for free tier)
* Scripting: Bash
* Version Control: Git & GitHub

---

##  Features

* Modular Terraform architecture
* Automated Jenkins installation (no manual setup required)
* Secure networking configuration
* Elastic IP for consistent access
* Real-world debugging and recovery (Java compatibility, service failures, repo issues)

---

##  Project Structure

```
terraform-jenkins-aws/
│
├── modules/
│   ├── vpc/
│   ├── ec2/
│   └── security_groups/
│
├── environments/
│   └── dev/
│
├── scripts/
│   └── install_jenkins.sh
│
├── diagrams/
│   └── architecture.png
│
├── README.md
```

---

## Deployment Steps

### 1. Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/terraform-jenkins-aws.git
cd terraform-jenkins-aws/environments/dev
```

---

### 2. Initialize Terraform

```bash
terraform init
```

---

### 3. Plan Infrastructure

```bash
terraform plan
```

---

### 4. Apply Infrastructure

```bash
terraform apply
```

---

##  Access Jenkins

After deployment:

```
http://<EC2_PUBLIC_IP>:8080
```

---

##  Retrieve Jenkins Admin Password

SSH into the instance:

```bash
ssh -i <your-key.pem> ubuntu@<EC2_PUBLIC_IP>
```

Then run:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

## Key Learnings

* Troubleshooting Jenkins service failures using systemd and logs
* Resolving Java version compatibility issues (Java 17 → Java 21)
* Debugging APT repository and GPG key errors
* Designing modular Terraform infrastructure
* Understanding the difference between infrastructure success and application readiness

---

##  Security Improvements

* Restricted SSH access using CIDR blocks
* Controlled exposure of Jenkins port (8080)
* Principle of least privilege applied in networking

---

##  Future Improvements

* Add GitHub Actions for automated Terraform deployment
* Use Docker to containerize Jenkins
* Implement HTTPS using Nginx + SSL
* Add monitoring (CloudWatch / Prometheus)
* Use remote backend (S3 + DynamoDB) for Terraform state

---

##  Author

**Moses Abiona**
DevOps Engineer | Cloud Enthusiast

---

##  Why This Project Matters

This project demonstrates the ability to:

* Design cloud infrastructure from scratch
* Automate CI/CD platform deployment
* Troubleshoot real production-level issues
* Apply DevOps best practices in a practical environment

---
