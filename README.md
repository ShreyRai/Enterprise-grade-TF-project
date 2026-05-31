# Multi-Tier, Multi-Environment AWS Infrastructure via Terraform

An enterprise-grade, highly modular Terraform repository designed to deploy a scalable, secure multi-tier web application stack on AWS. This project demonstrates advanced infrastructure-as-code (IaC) principles including strict directory-based environment isolation, component-level modularity, and advanced configuration patterns.

## 🚀 Core Architecture Features

* **Strict Environment Isolation:** Avoids risky CLI workspace mixing by utilizing a directory-separated environment pattern (`dev`, `qa`, and `prod`). Each environment maintains its own isolated lifecycle, variables, and blast-radius boundaries.
* **Component-Level Network Modularity:** Dynamically provisions a foundational network topology, including custom VPC configurations, isolated public/private subnets, and dedicated routing tables.
* **Decoupled Compute & Security Layers:** Separates firewall rules (Security Groups) from the actual virtual instances, ensuring clean structural dependencies and data flow.
* **DRY Configurations:** Integrates reusable underlying modules so that adding entirely new environments requires zero code replication—only variable updates via `.tfvars`.

---

## 📂 Repository Structure

```text
.
├── .gitignore                  # Prevents tracking of local state, secrets, and provider binaries
├── README.md                   # Project documentation and architectural overview
├── modules/                    # Reusable, source-of-truth infrastructure modules
│   ├── networking/             # Core networking component-level module
│   │   ├── vpc.tf              # Base VPC resource definition
│   │   ├── subnets.tf          # Public/Private subnet configurations
│   │   ├── routing.tf          # Gateways, Route Tables, and Associations
│   │   ├── variables.tf        # Network inputs
│   │   └── outputs.tf          # Network outputs (VPC IDs, Subnet Lists)
│   │
│   ├── computing/              # Virtual machine and application compute tier
│   │   ├── main.tf             # EC2 instances and configuration
│   │   ├── variables.tf        
│   │   └── outputs.tf          
│   │
│   └── security/               # Firewall and network access control tier
│       ├── main.tf             # AWS Security Group definitions
│       ├── variables.tf        
│       └── outputs.tf          # Security group IDs passed to compute
│
├── environments/               # Target execution layers (State boundaries)
│   ├── dev/                    # Development Environment
│   │   ├── main.tf             # Invokes modules with development constraints
│   │   ├── variables.tf        # Environment input schemas
│   │   ├── terraform.tfvars    # Dev-specific values (e.g., small instance sizes)
│   │   └── outputs.tf          
│   │
│   ├── qa/                     # Quality Assurance / Testing Environment
│   │   ├── main.tf             # Invokes modules with QA constraints
│   │   ├── variables.tf        
│   │   ├── terraform.tfvars    # QA-specific performance settings
│   │   └── outputs.tf          
│   │
│   └── prod/                   # Production Environment
│       ├── main.tf             # Invokes modules with strict production constraints
│       ├── variables.tf        
│       ├── terraform.tfvars    # High-availability and scaled production sizes
│       └── outputs.tf          
│
└── legacy_migration/           # Isolated workspace for brownfield asset tracking