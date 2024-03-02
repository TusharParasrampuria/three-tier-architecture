resource "aws_launch_template" "launch-template" {
  name     = var.launch_template_name
  image_id = data.aws_ami.ecs_ami.id

  instance_type = var.instance_type
  key_name      = var.ssh_key_name

  block_device_mappings {
    device_name = tolist(data.aws_ami.ecs_ami.block_device_mappings)[0].device_name

    ebs {
      volume_size = var.root_volume_size
      volume_type = var.root_storage_type
      encrypted   = var.encrypt_volume
    }
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [image_id]
  }

  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 3
    http_endpoint               = "enabled"
  }

}

resource "aws_instance" "instance" {
  count                       = var.instance_count
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = element(aws_subnet.subnets.*.id, count.index)

  launch_template {
    id      = aws_launch_template.launch-template.id
    version = "$Latest"
  }

  tags = {
    Name = "${var.instance_name}-${count.index + 1}"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [ami]
  }
}

