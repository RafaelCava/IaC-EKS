module "Homolog" {
  source = "../../infra"

  repository   = "homolog-repository"
  cargoIAM     = "homolog"
  ambiente     = "homolog"
  cluster_name = "homolog"
  # aws_region   = "us-west-1"
}

output "DNS" {
  value = module.Homolog.URL
}
