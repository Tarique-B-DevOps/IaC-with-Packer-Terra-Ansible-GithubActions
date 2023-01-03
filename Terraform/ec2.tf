data "aws_ami" "packer_image" {
    most_recent = true
    owners = ["185839454572"]
    filter {
        name = "name"
        values = ["Todo-app-*"]
    }
}

resource "aws_instance" "nodejs_server" {
    ami = data.aws_ami.packer_image.id
    instance_type = "t2.micro"
    subnet_id              = aws_subnet.tf-sub.id
    vpc_security_group_ids = [aws_security_group.tf-sg.id]
     key_name               = "lvl"
    tags = {
        Name = "Todo-Nodejs-App"
    }
}

output "public_ip"{
    value = aws_instance.nodejs_server[*].public_ip

}