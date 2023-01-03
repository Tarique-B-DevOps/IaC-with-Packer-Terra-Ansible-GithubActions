# Infrastructure as Code for Nodejs Todo app with github actions Pipeline

# Tools Used

#### **Packer**    = Create Ready to deploy AMI for Nodejs Todo list app and push it to aws account
#### **Ansible**   = Used as provisioner for the packer for configuration manangment including package installations and application configurations.
#### **Terraform** = Used to Provision the EC2 instance with most recently pushed AMI by packer. Also Provisions VPC, Subnets, SG, IGW and Load balancer.
#### **Github Actions** = Used for CI/CD pipeline for automating the AMI building and deployment process.
