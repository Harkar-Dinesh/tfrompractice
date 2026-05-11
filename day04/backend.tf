terraform {
  backend "s3" {
    bucket = "thisisfortestingpurposeofstatelock"
    key    = "statelock2.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}