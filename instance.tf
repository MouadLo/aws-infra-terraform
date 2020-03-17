resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

 /*  # the root volume
  root_block_device {
    volume_size = 16
    volume_type = "gp2"
    delete_on_termination = true
  } */

  # user data
  user_data = data.template_cloudinit_config.cloudinit-example.rendered
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2" # General Purpose storage, can also be standard or io2 or st1
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id    = aws_ebs_volume.ebs-volume-1.id
  instance_id  = aws_instance.example.id
  skip_destroy = true   # skip destroy to avoid issues with terraform destroy
}

