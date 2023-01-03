data "aws_subnets" "tf-sub" {
  filter {
    name = "vpc-id"
    values = [aws_vpc.tf-vpc.id]
  }
}
data "aws_vpc" "tf-vpc" {
  default = true
}
resource "aws_lb" "todo" {
  name            = "todo-nodejs-alb"
  subnets         = [aws_subnet.tf-sub.id, aws_subnet.tf-sub2.id, aws_subnet.tf-sub3.id]
  security_groups = [aws_security_group.tf-sg.id]
  internal = false
  ip_address_type = "ipv4"
  load_balancer_type = "application"
    tags = {
    Environment = "todo-alb"
  }
}
resource "aws_lb_target_group" "todo" {
  name        = "todo-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.tf-vpc.id
  target_type = "instance"
  stickiness {
    enabled = true
    type    = "lb_cookie"
  }
   health_check {
    path = "/"
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    matcher = "200,302"  # has to be HTTP 200 or fails
  }
}
resource "aws_lb_target_group_attachment" "tg-attachment" {
  target_group_arn = aws_lb_target_group.todo.arn
  target_id        = aws_instance.nodejs_server.id
  port             = 80
}
resource "aws_lb_listener" "todo" {
  load_balancer_arn = aws_lb.todo.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.todo.arn
    type             = "forward"
  }
}