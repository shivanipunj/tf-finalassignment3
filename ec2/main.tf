resource "aws_instance" "ec2-test" {
    ami = var.ami-id
    instance_type = var.instance
    tags = {
    "name" = "shivani"
    "owner" = "shivani.sharma@cloudeq.com"
    }
    volume_tags = {
    "name" = "shivani"
    "owner" = "shivani.sharma@cloudeq.com"
    }
}
  

