# Automating Immutable Infrastructure with Packer, Terraform, Ansible and Github Actions for an Nodejs Todo List Application.

# Tools Used :

#### **Packer** [`./Packer/ami.pkr.hcl`](./Packer/ami.pkr.hcl)   = Create Ready to deploy AMI for Nodejs Todo list app and push it to aws account
#### **Ansible** [`./Ansible/setup.yml`](./Ansible/setup.yml)   = Used as provisioner for the packer for configuration manangment including package installations and application configurations.
#### **Terraform** [`./Terraform/`](./Terraform/) = Used to Provision the EC2 instance with most recently pushed AMI by packer. Also Provisions VPC, Subnets, SG, IGW and Load balancer.
#### **GitHub Actions** [`.github/workflows/IaC.yml`](.github/workflows/IaC.yml) = Used for CI/CD pipeline for automating the AMI building and deployment process.
----------

# Architecture :

![Architecture2](https://user-images.githubusercontent.com/86839948/210767757-a1ef9e7c-77c1-492e-be3f-3e054dbaeb12.jpg)


# Screenshots :

- ## Github Actions Workflow : [Click Here For Summary](https://github.com/Tarique-B/IaC-with-Packer-Terra-Ansible-GithubActions/actions/runs/3831941576)



![Screenshot (12)](https://user-images.githubusercontent.com/86839948/210515614-66b52a09-7269-4df5-b814-902cd6b7a4ea.jpg)
![Screenshot (13)](https://user-images.githubusercontent.com/86839948/210515695-880de0ae-d9df-47e6-9f84-ed97ba9d9a4a.jpg)
![Screenshot (14)](https://user-images.githubusercontent.com/86839948/210515701-eaf39831-a27b-4d16-b016-894798acb539.jpg)


----------

- ## Access Application on Load Balancer URL



![Screenshot (17)](https://user-images.githubusercontent.com/86839948/210515706-b6d01a35-2433-49e9-94d6-f02c09bc9b75.jpg)

![Screenshot (18)](https://user-images.githubusercontent.com/86839948/210515715-42412c62-ba85-4eae-b6a2-89a0f59d9c62.jpg)

![Screenshot (19)](https://user-images.githubusercontent.com/86839948/210516786-ea4ccc4a-d13c-48fd-a95f-eb6bc1a9a0d0.jpg)



----------



