resource "kubernetes_deployment" "Django-API" {
  metadata {
    name = "django-api"
    labels = {
      nome = "django"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        nome = "django"
      }
    }

    template {
      metadata {
        labels = {
          nome = "django"
        }
      }

      spec {
        container {
          image = "174180015834.dkr.ecr.us-west-2.amazonaws.com/producao-repository:v1"
          name  = "django-api"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/clientes/"
              port = 8000
            }

            initial_delay_seconds = 10
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "LoadBalancer" {
  metadata {
    name = "load-balance-django-api"
  }
  spec {
    selector = {
      nome = "django"
    }
    port {
      port        = 8000
      target_port = 8000
    }
    type = "LoadBalancer"
  }
}

data "kubernetes_service" "Dns_name" {
  metadata {
    name = "load-balance-django-api"
  }
}

output "URL" {
  value = data.kubernetes_service.Dns_name.status
}