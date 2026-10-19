# Argo CD as a single Helm release, owned by this module (nothing else may manage the release,
# for example no Argo Application pointing at the argo-cd chart).
#
# The provider block lives here on purpose: a Terragrunt account generates a single provider,
# and the cluster layers mix several (proxmox, talos, helm).
provider "helm" {
  kubernetes = {
    config_path    = var.kubeconfig_path
    config_context = var.kube_context
  }
}

resource "helm_release" "argocd" {
  name       = var.release_name
  namespace  = var.namespace
  repository = var.repository
  chart      = var.chart
  version    = var.chart_version

  # The namespace already holds Argo's own data; never let Helm own it.
  create_namespace = false

  values = var.values
}
