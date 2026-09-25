# Changelog

All notable changes to this project are documented in this file. The format is
based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this
project follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Updated [`astral-sh/uv`](https://github.com/astral-sh/uv) from [`0.12.17` to `0.12.19`](https://app.renovatebot.com/package-diff?name=astral-sh%2Fuv&from=0.12.17&to=0.12.19)
- Updated [`golangci/golangci-lint`](https://github.com/golangci/golangci-lint) from [`2.13.2` to `2.14.0`](https://app.renovatebot.com/package-diff?name=golangci%2Fgolangci-lint&from=2.13.2&to=2.14.0)
- Updated [`hashicorp/terraform`](https://github.com/hashicorp/terraform) from [`1.16.3` to `1.16.4`](https://app.renovatebot.com/package-diff?name=hashicorp%2Fterraform&from=1.16.3&to=1.16.4)
- Updated [`nodejs/node`](https://github.com/nodejs/node) from [`24.21.0` to `26.10.0`](https://app.renovatebot.com/package-diff?name=nodejs%2Fnode&from=24.21.0&to=26.10.0)
- Updated [`npm`](https://github.com/npm/cli) from [`12.0.2` to `12.1.0`](https://app.renovatebot.com/package-diff?name=npm&from=12.0.2&to=12.1.0)
- Updated `redhat/ubi9-minimal` from `9.8-1789546276` to `9.8-1790074235`
- Updated `redhat/ubi9-minimal` from `9.8-1789546276` to `9.8-1790074235`
- Updated `redhat/ubi9-minimal` from `9.8-1789546276` to `9.8-1790074235`

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
