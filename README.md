# iac-argocd

Reusable OpenTofu/Terraform module: Argo CD as one Helm release (`argo-cd` chart).

Consumed through Terragrunt, one unit per cluster:

```hcl
terraform {
  source = "git::https://github.com/cmoreira-dev/iac-argocd.git//module?ref=v0.1.0"
}

inputs = {
  kube_context  = "<kubeconfig context>"
  chart_version = "<argo-cd chart version>"
  values        = [file("${get_terragrunt_dir()}/values.yaml")]
}
```

A chart bump is a one-line change to `chart_version`. See [docs/index.md](docs/index.md).
