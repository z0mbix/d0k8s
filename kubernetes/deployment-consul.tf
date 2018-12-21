resource "kubernetes_deployment" "consul" {
  metadata {
    name = "consul"

    labels {
      name = "consul"
    }
  }

  spec {
    replicas = "${lookup(var.consul, "replicas")}"

    selector {
      match_labels {
        name = "consul"
      }
    }

    template {
      metadata {
        labels {
          name        = "consul"
          environment = "${var.env_name}"
        }
      }

      spec {
        container {
          image = "consul:1.4.0"
          name  = "consul"
        }
      }
    }
  }
}
