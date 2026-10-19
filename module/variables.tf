variable "kubeconfig_path" {
  description = "Path to the kubeconfig used to reach the cluster. Never commit it."
  type        = string
  default     = "~/.kube/config"
}

variable "kube_context" {
  description = "Kubeconfig context of the target cluster. Null uses the kubeconfig's current context."
  type        = string
  default     = null
}

variable "release_name" {
  description = "Helm release name."
  type        = string
  default     = "argocd"
}

variable "namespace" {
  description = "Namespace of the release. It must already exist: the module never owns it."
  type        = string
  default     = "argocd"
}

variable "repository" {
  description = "Helm repository of the chart."
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "chart" {
  description = "Chart name."
  type        = string
  default     = "argo-cd"
}

variable "chart_version" {
  description = "argo-cd chart version. Bump deliberately: it is the version Argo runs."
  type        = string
}

variable "values" {
  description = "Helm values documents (YAML strings), applied in order. Keep secrets out: reference Kubernetes Secrets instead."
  type        = list(string)
  default     = []
}
