terraform {
  backend "s3" {
    bucket = "terraform-state-rafael-cavalcante"
    key    = "Homolog/terraform.tfstate"
    region = "us-west-2"
  }
}
