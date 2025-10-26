resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = merge(
    var.tags,
    {
      Name = var.ec2_name
    }
  )
}