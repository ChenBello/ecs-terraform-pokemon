#################################################################################################
# This file describes the Load Balancer resources: ALB, ALB target group, ALB listener
#################################################################################################

#Defining the Application Load Balancer
resource "aws_alb" "application_load_balancer" {
  name                      = "${var.app_name}-alb"
  internal                  = false
  load_balancer_type        = "application"
  subnets                   = [var.public_subnet_1_id, var.public_subnet_2_id]
  security_groups           = [aws_security_group.alb_sg.id]
}

#Defining the target group and a health check on the application
resource "aws_lb_target_group" "target_group" {
  name                      = "${var.app_name}-tg"
  port                      = var.container_port
  protocol                  = "HTTP"
  target_type               = "ip"
  vpc_id                    = var.vpc_id // aws_vpc.vpc.id
  health_check {
      path                  = "/health"
      protocol              = "HTTP"
      matcher               = "200"
      port                  = "traffic-port"
      healthy_threshold     = 2
      unhealthy_threshold   = 2
      timeout               = 10
      interval              = 30
  }
}

#Defines an HTTP Listener for the ALB
resource "aws_lb_listener" "listener" {
  load_balancer_arn         = aws_alb.application_load_balancer.arn
  port                      = "80"
  protocol                  = "HTTP"

  default_action {
    type                    = "forward"
    target_group_arn        = aws_lb_target_group.target_group.arn
  }
}