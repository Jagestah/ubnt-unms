# ubnt-unms
---
This repo will contain a codified Ubiquiti UNMS server that can be deployed to AWS using some of the most popular DevOps tools
- Terraform
  - For provisioning AWS resources
  - Statefiles stored in a pre-configured S3 Bucket
- Ansible
  - For configuring the host
  - Installs:
    - Docker
    - Ubiquiti UNMS Container
