resource "kubernetes_deployment" "web" {
  metadata {
    name = "web"

    labels {
      name = "web-fe"
    }
  }

  spec {
    replicas = "${lookup(var.nginx, "replicas")}"

    selector {
      match_labels {
        name = "web-fe"
      }
    }

    template {
      metadata {
        labels {
          name        = "web-fe"
          environment = "${var.env_name}"
        }
      }

      spec {
        container {
          image = "nginx:1.14.2"
          name  = "web"

          resources {
            limits {
              cpu    = "0.5"
              memory = "256Mi"
            }

            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
