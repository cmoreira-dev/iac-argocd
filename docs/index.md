# iac-argocd

Argo CD installed and owned as a single `helm_release`.

## Inputs (`module/variables.tf`)

| Variable | Purpose |
|---|---|
| `chart_version` | argo-cd chart version (required). The only thing an upgrade changes |
| `values` | Helm values documents (YAML strings), no secret literals |
| `kubeconfig_path`, `kube_context` | How the provider reaches the cluster |
| `release_name`, `namespace`, `repository`, `chart` | Defaults match the upstream chart |

## Rules

- The namespace must already exist; the module sets `create_namespace = false`.
- Nothing else may manage the release.
- Keep secrets out of `values`: reference a Kubernetes Secret (for example one an external secrets
  operator syncs).
- The `provider "helm"` block is declared in the module because a Terragrunt account generates a
  single provider.

## Adopting an existing release

Import it (`helm_release` id `<namespace>/<name>`). The first plan shows one in-place change: the
provider does not fill `repository` and `values` on import, so the first apply runs one
`helm upgrade`. Prove it is a no-op before applying (values equal the live `helm get values`, and
`helm template` equals the installed manifest).
