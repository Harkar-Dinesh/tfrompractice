resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.type
}


resource "aws_s3_bucket" "example" {
  bucket = "terraformpracticebucket123"
}