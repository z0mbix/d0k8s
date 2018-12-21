provider "digitalocean" {}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "${var.env_name}"
  region  = "${var.region}"
  version = "${var.k8s_version}"

  tags = [
    "environment:${var.env_name}",
    "owner:${var.owner_name}",
  ]

  node_pool {
    name       = "${var.env_name}-pool"
    size       = "${var.node_type}"
    node_count = "${var.node_count}"

    tags = [
      "environment:${var.env_name}",
      "owner:${var.owner_name}",
    ]
  }
}

provider "kubernetes" {
  host = "${digitalocean_kubernetes_cluster.cluster.endpoint}"

  client_certificate     = "${base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)}"
}
