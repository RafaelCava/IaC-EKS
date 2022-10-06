terraform {
  backend "s3" {
    bucket = "terraform-state-rafael-cavalcante"
    key    = "Prod/terraform.tfstate"
    region = "us-west-2"
  }
}
