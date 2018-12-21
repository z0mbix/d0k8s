variable "env_name" {}
variable "region" {}
variable "node_count" {}
variable "k8s_version" {}
variable "node_type" {}
variable "owner_name" {}

variable "nginx" {
  type = "map"

  default = {
    replicas = 3
  }
}

variable "consul" {
  type = "map"

  default = {
    replicas = 1
  }
}
