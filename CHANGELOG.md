# Changelog

All notable changes to this project are documented in this file. The format is
based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this
project follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2026-10-10

### Changed

- Updated [`@biomejs/biome`](https://github.com/biomejs/biome) from [`2.5.14` to `2.5.15`](https://app.renovatebot.com/package-diff?name=%40biomejs%2Fbiome&from=2.5.14&to=2.5.15)
- Updated [`apache/maven`](https://github.com/apache/maven) from [`3.9.16` to `3.10.0`](https://app.renovatebot.com/package-diff?name=apache%2Fmaven&from=3.9.16&to=3.10.0)
- Updated [`aquasecurity/trivy`](https://github.com/aquasecurity/trivy) from [`0.74.0` to `0.75.0`](https://app.renovatebot.com/package-diff?name=aquasecurity%2Ftrivy&from=0.74.0&to=0.75.0)
- Updated [`astral-sh/uv`](https://github.com/astral-sh/uv) from [`0.12.17` to `0.13.0`](https://app.renovatebot.com/package-diff?name=astral-sh%2Fuv&from=0.12.17&to=0.13.0)
- Updated [`betterleaks/betterleaks`](https://github.com/betterleaks/betterleaks) from [`1.8.1` to `1.9.0`](https://app.renovatebot.com/package-diff?name=betterleaks%2Fbetterleaks&from=1.8.1&to=1.9.0)
- Updated [`docker/buildx-bin`](https://github.com/docker/buildx) from `0.37.1` to `0.38.0`
- Updated [`golang/go`](https://github.com/golang/go) from [`1.27.1` to `1.27.2`](https://app.renovatebot.com/package-diff?name=golang%2Fgo&from=1.27.1&to=1.27.2)
- Updated [`golangci/golangci-lint`](https://github.com/golangci/golangci-lint) from [`2.13.2` to `2.14.0`](https://app.renovatebot.com/package-diff?name=golangci%2Fgolangci-lint&from=2.13.2&to=2.14.0)
- Updated [`hashicorp/terraform`](https://github.com/hashicorp/terraform) from [`1.16.3` to `1.16.5`](https://app.renovatebot.com/package-diff?name=hashicorp%2Fterraform&from=1.16.3&to=1.16.5)
- Updated [`helm-unittest/helm-unittest`](https://github.com/helm-unittest/helm-unittest) from [`1.1.2` to `1.2.1`](https://app.renovatebot.com/package-diff?name=helm-unittest%2Fhelm-unittest&from=1.1.2&to=1.2.1)
- Updated [`mikefarah/yq`](https://github.com/mikefarah/yq) from [`4.53.6` to `4.54.1`](https://app.renovatebot.com/package-diff?name=mikefarah%2Fyq&from=4.53.6&to=4.54.1)
- Updated [`nodejs/node`](https://github.com/nodejs/node) from [`24.21.0` to `26.11.1`](https://app.renovatebot.com/package-diff?name=nodejs%2Fnode&from=24.21.0&to=26.11.1)
- Updated [`npm`](https://github.com/npm/cli) from [`12.0.2` to `12.2.0`](https://app.renovatebot.com/package-diff?name=npm&from=12.0.2&to=12.2.0)
- Updated [`opentofu/opentofu`](https://github.com/opentofu/opentofu) from [`1.12.6` to `1.13.1`](https://app.renovatebot.com/package-diff?name=opentofu%2Fopentofu&from=1.12.6&to=1.13.1)
- Updated `redhat/ubi9-minimal` from `9.8-1789546276` to `9.8-1791279563`

## [1.0.5] - 2026-09-21

### Changed

- `RELEASE_CHANGELOG.md` is no longer attached as a GitHub Release asset. It is the
  release body, so attaching it duplicated the same text as a download. It remains
  in the workflow payload artifact, which the Teams notification reads.

## [1.0.4] - 2026-09-21

### Fixed

- Release notes no longer inline the full Trivy report, which pushed the GitHub
  release body past its 125,000-character limit. The report stays attached as
  `trivy_scan_report.tar.gz`.

## [1.0.3] - 2026-09-21

### Fixed

- Release artifacts are attached again: the CI library's containerised jobs called
  `gh`, which is not in the toolkit image, so every provenance lookup and the
  candidate artifact download silently returned nothing.

### Added

- The image creates `$GOPATH/bin`, which `PATH` already referenced, and the smoke
  test asserts it.

## [1.0.2] - 2026-09-21

### Added

- Smoke test asserts `NODE_PATH`, which the image sets beside `NODE_HOME` but the
  test never checked.

## [1.0.1] - 2026-09-21

### Added

- Smoke test now verifies `yarnpkg`, which the image links beside `yarn` but the
  test never exercised.

### Changed

- The release pipeline promotes the image the pull request built rather than
  rebuilding it, and no longer re-runs lint, scan or the release guards.

## [1.0.0] - 2026-09-19

### Added

- Initial toolkit Docker E2E project.
