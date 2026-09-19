# Toolkit Docker E2E Playground

Release `1.0.0` · [Compatibility](https://github.com/grootan-devops/ai-skills/blob/main/COMPATIBILITY.md) · [Security](./SECURITY.md) · [Reporting policy](./CONTRIBUTING.md)

This repository is the end-to-end consumer project for the Grootan GitHub CI
library's Docker pipeline. It carries a reviewable snapshot of the toolkit
`Dockerfile` and its image smoke test, builds and scans candidate images, then
promotes the verified digest to Docker Hub as `grootantec/toolkit:1.0.0`.

## Release contract

- Release version: `1.0.0`, stored in [`VERSION`](./VERSION).
- Production image: `registry-1.docker.io/grootantec/toolkit:1.0.0`.
- Immutable release tag: `1.0.0`; promotion also updates the convenience aliases
  `1.0`, `1`, and `latest` to the same digest.
- CI library during pre-release validation: `grootan-devops/github-ci-library@dev`.
  Replace `@dev` with `@1.0.0` after the immutable release tag is published.
- Runtime contract: the image must report Java 25.x and Python 3.12.x; the
  smoke test rejects any other runtime family.
- Pull requests publish candidate tags, run the toolkit smoke test inside the
  built image, scan the exact exported image tar, and execute release guards.
- A merge to `main` promotes the candidate digest without rebuilding it and
  creates the GitHub release.

The candidate and production tags use the same Docker Hub repository. Candidate
tags include the workflow run and pull-request number, while production tags are
semantic versions.

## Included E2E files

| File | Purpose |
|---|---|
| [`Dockerfile`](./Dockerfile) | Builds the complete toolkit image. |
| [`ci_image_test.sh`](./ci_image_test.sh) | Verifies every required tool inside the resulting image. |
| [`.github/workflows/pr.yml`](./.github/workflows/pr.yml) | Builds, tests, scans, and guards candidate images. |
| [`.github/workflows/release.yml`](./.github/workflows/release.yml) | Promotes the verified candidate and publishes release notes. |
| [`.github/workflows/build.yml`](./.github/workflows/build.yml) | Manually builds, publishes, and smoke-tests a candidate image. |
| [`.github/workflows/lint.yml`](./.github/workflows/lint.yml) | Runs the reusable Dockerfile, YAML, and changelog linters. |
| [`.github/workflows/check.yml`](./.github/workflows/check.yml) | Runs release prerequisites without building an image. |
| [`.github/workflows/image-scan.yml`](./.github/workflows/image-scan.yml) | Scans any published toolkit image tag. |
| [`.github/workflows/secret-scan.yml`](./.github/workflows/secret-scan.yml) | Scans the complete Git history for exposed secrets. |
| [`CHANGELOG.md`](./CHANGELOG.md) | Initial `1.0.0` release notes. |

## GitHub repository configuration

Configure these Actions variables:

| Variable | Value |
|---|---|
| `IMAGE_REGISTRY` | `registry-1.docker.io` |
| `IMAGE_REPOSITORY` | `grootantec/toolkit` |

This Docker-only project deliberately disables the shared migration guard. Its
compatibility surface is the published OCI image and the smoke-test contract.

Configure these Actions secrets:

| Secret | Purpose |
|---|---|
| `IMAGE_REGISTRY_USERNAME` | Docker Hub account or organization service account. |
| `IMAGE_REGISTRY_PASSWORD` | Docker Hub access token with permission to push `grootantec/toolkit`. |

## Local verification

Build the same image locally:

```bash
docker build \
  --tag grootantec/toolkit:1.0.0 \
  .
```

Run the E2E smoke test inside it:

```bash
docker run --rm \
  --volume "$PWD:/tmp/image-test:ro" \
  --entrypoint bash \
  grootantec/toolkit:1.0.0 \
  -c 'cd /tmp/image-test && ./ci_image_test.sh'
```

## License

Copyright 2026 Grootan Technologies Pvt Ltd.

Licensed under the [GNU Affero General Public License v3.0](./LICENSE.md)
(`AGPL-3.0-only`). External contributions are not accepted; see
[CONTRIBUTING.md](./CONTRIBUTING.md) for bug and security reporting.
