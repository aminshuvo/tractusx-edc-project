provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "tractusx" {
  metadata {
    name = "tractusx"
  }
}

resource "kubernetes_namespace" "edc" {
  metadata {
    name = "edc"
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}
