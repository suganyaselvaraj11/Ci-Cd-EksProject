# 🚀 vProfile DevOps CI/CD Pipeline Project

## 📌 Project Overview
This project demonstrates an end-to-end DevOps CI/CD pipeline for a multi-tier Java-based web application (vProfile). The goal is to automate build, test, security scanning, containerization, deployment, and monitoring using modern DevOps tools.

The application simulates a real-world production environment with multiple services including web, application, database, cache, and messaging layers.

---

## 🏗️ Architecture Overview

User → Nginx → Tomcat (Java App) → MySQL  
                      ↓  
             Memcached + RabbitMQ  

---

## ⚙️ DevOps Workflow

1. Developer pushes code to GitHub  
2. Jenkins triggers CI/CD pipeline  
3. Maven builds the application  
4. SonarQube performs code quality analysis  
5. Docker builds application image  
6. Trivy scans image for vulnerabilities  
7. Image pushed to Docker Hub  
8. Kubernetes (AWS EKS) deploys application  
9. Prometheus collects metrics  
10. Grafana visualizes system performance  

---

## 🛠️ Technologies Used

### CI/CD Tools
- Jenkins

### Cloud Platform
- Amazon Web Services (EC2, EKS, IAM)

### Containerization
- Docker

### Orchestration
- Kubernetes

### Code Quality & Security
- SonarQube
- Trivy

### Monitoring
- Prometheus
- Grafana

### Version Control
- Git & GitHub

### Operating System
- Linux (Ubuntu)

---

## 📁 Repository Structure

```text
vprofile-devops-project/
│
├── ci-cd/              # Jenkins pipeline & SonarQube config
├── docker/            # Dockerfile & compose files
├── kubernetes/        # K8s manifests (deployment, service)
├── monitoring/        # Prometheus & Grafana configs
├── scripts/           # Setup automation scripts
├── docs/              # Architecture diagrams & screenshots
├── README.md