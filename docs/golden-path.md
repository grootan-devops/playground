# Contoso Golden Path

This documentation-only reference shows how a Contoso Corporation service moves
from source control to Kubernetes through the Grootan platform libraries.

```text
application source
  -> GitHub Actions or GitLab CI
  -> tested OCI image and Helm chart
  -> GitOps values update
  -> ArgoCD application reconciliation
  -> Kubernetes workload
```

## 1. Verify and publish

GitHub consumers call reusable workflows from
`grootan-devops/github-ci-library@1.0.0`. GitLab consumers include the equivalent
templates at release `1.0.0`. Both paths test the application, build the candidate
once, scan it, and publish the candidate image and chart to
`registry.contoso.com`.

Production release promotes the verified candidate by digest instead of rebuilding
it, so the released bytes are the bytes that passed review.

## 2. Update desired state

The deployment job updates the Contoso GitOps repository with the promoted chart or
image version. Environment values remain in Git; credentials remain in the CI
platform and cluster secret-management system.

The GitOps root chart pins `argocd-gitops-tpl-library` at `1.0.0` and declares each
service, namespace, chart source, and synchronization policy.

## 3. Reconcile with ArgoCD

The root App-of-Apps application discovers service definitions and optional raw
manifest stacks. ArgoCD renders the pinned chart, compares desired and live state,
and applies the reviewed Git change to the Kubernetes cluster.

## 4. Infrastructure boundary

Cloud prerequisites are provisioned separately from
`grootan-devops/terraform-modules` pinned at `1.0.0`. Application delivery consumes
their outputs but does not perform privileged infrastructure changes during a normal
service deployment.

## Verification points

- CI and GitOps dependencies use exact `1.0.0` pins.
- The promoted OCI digest matches the candidate that passed scans.
- The GitOps commit contains only the intended version update.
- ArgoCD reports the application `Synced` and `Healthy`.
- Kubernetes reports the rollout available with the promoted image digest.

This guide uses fictional Contoso endpoints and contains no deployable credentials
or live-cloud assumptions.
