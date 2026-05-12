terraform {
  backend "s3" {
    bucket = "testdemoforterraform"
    key    = "test.tfstate"
    region = "us-east-1"
    
  }
}