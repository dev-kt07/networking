resource "aws_launch_template" "this" {
  name_prefix   = var.name
  image_id      = var.ami_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.name
    }
  }
}

resource "aws_autoscaling_group" "this" {
  name                      = "${var.name}-asg"
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  vpc_zone_identifier       = var.subnet_ids
  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete              = true

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
