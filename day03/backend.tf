terraform {
  backend "s3" {
    bucket = "thisisfortestingpurposeofstatelock"
    key    = "statelock.tfstate"
    region = "us-east-1"
  }
}