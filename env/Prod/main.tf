module "Prod" {
  source = "../../infra"

  repository   = "producao-repository"
  cargoIAM     = "producao"
  ambiente     = "producao"
  cluster_name = "producao"
}

output "DNS" {
  value = module.Prod.URL
}