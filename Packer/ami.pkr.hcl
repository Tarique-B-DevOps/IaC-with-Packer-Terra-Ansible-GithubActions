variable "ami_id" {
    type = string
    default= "ami-0149b2da6ceec4bb0"
}

locals {
    app_name = "Todo-app"
}

source "amazon-ebs" "Todo-app" {
    ami_name = "${local.app_name}-{{timestamp}}"
    instance_type= "t2.micro"
    region = "us-east-1"
    source_ami = "${var.ami_id}"
    ssh_username = "ubuntu"
    tags = {
        Name = local.app_name
    }

}

build {
    sources = ["source.amazon-ebs.Todo-app"]
        provisioner "ansible" {
        playbook_file = "/home/runner/work/IaC-with-Packer-Terra-Ansible-GithubActions/IaC-with-Packer-Terra-Ansible-GithubActions/Ansible/setup.yml"
        user = "ubuntu"    
        ansible_ssh_extra_args = ["-oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa"]    
    }
}
