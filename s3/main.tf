resource "aws_s3_bucket" "s3" {
    bucket = var.bucket
    tags =   var.tags
        # "name" = "shivani-s3"
        # owner = "shivani.sharma@cloudeq.com"
        # purpose = "training"
    
}
    