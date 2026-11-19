# GitHub CI Library Playground

End-to-end consumer project for the
[github-ci-library](https://github.com/grootan-devops/github-ci-library) release flow:
a pull request builds, smoke-tests and scans a candidate image, and the merge promotes
that exact candidate by digest, with no rebuild, then publishes the GitHub Release.

| Path | Purpose |
| --- | --- |
| `cmd/server` | Test application: HTTP server whose `-version` prints its version and marker. |
| `Dockerfile` | Builds the binary in `grootantech/toolkit`, runs it on `grootantech/micro-root`. |
| `ci_image_test.sh` | Smoke test run inside the candidate image. |
| `chart` | `playground-chart`, an OCI Helm chart on Docker Hub (`grootantech/playground-chart`) built on `tpl-library`. |
| `infra/network`, `infra/storage` | Two Terraform roots, scanned as a matrix. |
| `.github/workflows/pr.yml` | Candidate build, smoke test, image and Terraform scans, release checks. |
| `.github/workflows/release.yml` | Promotes the merged pull request's candidate and publishes the release. |

## Repository configuration

| Setting | Value |
| --- | --- |
| `vars.IMAGE_REGISTRY` | `registry-1.docker.io` |
| `vars.IMAGE_REPOSITORY` | `grootantech/playground` (candidates: `grootantech/playground-dev`) |
| `secrets.IMAGE_REGISTRY_USERNAME` / `IMAGE_REGISTRY_PASSWORD` | Docker Hub push credentials |
| `vars.CHART_REGISTRY` / `vars.CHART_REPOSITORY` | `registry-1.docker.io` / `grootantech` |
| `secrets.CHART_REGISTRY_USERNAME` / `CHART_REGISTRY_PASSWORD` | Docker Hub credentials for the chart (the same account) |

The `main` ruleset accepts changes only through the squash merge queue, so every release
comes from a merged pull request.
