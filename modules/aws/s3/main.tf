resource "aws_s3_bucket" "bucket" {
  bucket = "fomiller-dev"

  object_lock_configuration {
    object_lock_enabled = false
  }
  tags = {
    Owner       = "Forrest Miller"
    Email       = "forrestmillerj@gmail.com"
    Environment = "Dev"
  }
}
