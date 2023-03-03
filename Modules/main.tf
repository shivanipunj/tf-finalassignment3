module "ec2" {
    count = 4
    source = "../ec2"
    ami-id = var.ami
    instance = var.instance
    # tags = var.tags
}

module "s3" {
    source = "../s3"
    bucket = var.bucket
    tags = var.tags
  
}
module "vpc" {
    source = "../vpc"
    subnet_cidr = "10.0.1.0/24"
    vpc_tag = {
      "name" = "shivani"
      "owner" = "shivani.sharma@cloudeq.com"
      "purpose" = "training"

    }
    subnet_tag = {
       "name" = "shivani"
       "owner" = "shivani.sharma@cloudeq.com"
       "purpose" = "training"
    }
  
}

# module "s3" {
#     source = "../s3"
#     bucket = var.bucket
#     tags = var.tags
  
# }