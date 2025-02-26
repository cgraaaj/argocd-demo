resource "argocd_application" "helm" {
  metadata {
    name      = "helm-app-using-terraform"
    namespace = "argocd-qa"
    labels = {
      test = "true"
    }
  }

  spec {
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }

    source {
      repo_url        = "https://github.com/cgraaaj/argocd-demo.git"
      path            = "nginx"
      target_revision = "main"
      helm {
        value_files = ["values-qa.yml"]
      }
    }
  }
}