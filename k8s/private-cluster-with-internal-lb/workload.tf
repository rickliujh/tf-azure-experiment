resource "kubernetes_service_v1" "internal-lb" {
  metadata {
    name = "internal-app"
    annotations = {
      "service.beta.kubernetes.io/azure-load-balancer-internal" = "true"
      "service.beta.kubernetes.io/azure-pls-create"             = "true"
    }
  }
  spec {
    type = "LoadBalancer"
    port {
      port = 80
    }
    selector = {
      app = "internal-app"
    }
  }
}
