terraform {
  backend "s3" {
    bucket = "drtyyuhjikogfdrtuyj"
     key    = "values.tfstate"
    region = "us-east-1"
  }
}