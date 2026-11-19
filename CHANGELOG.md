# Changelog

All notable changes to this project are documented in this file. The format is
based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this
project follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.4] - 2026-11-18

### Changed

- Scenario 12: hotfix on the 1.2 line after 1.3.2; only the 1.2 alias moves and GitHub's Latest badge stays on 1.3.2.

## [1.3.3] - 2026-11-18

### Changed

- Scenario 11: no chart candidate on 1.9.3, so the release preflight must stop it before anything is published.

## [1.3.2] - 2026-11-18

### Changed

- Scenario 10: github-ci-library 1.9.3; the release notes and the attached chart describe the released 1.3.2, and re-running the release changes nothing.

## [1.3.1] - 2026-11-18

### Changed

- Scenario 9: the pull request publishes no chart candidate, so the release must refuse the chart instead of packaging the working tree.

## [1.3.0] - 2026-11-18

### Changed

- Scenario 8: a Helm chart (`playground-chart`, on the shared `tpl-library`) published to Docker Hub as an OCI artifact: the pull request pushes a candidate chart, the release promotes that exact candidate.

## [1.2.3] - 2026-11-18

### Changed

- Scenario 7: merged with a true merge commit (MERGE queue); the release commit has two parents.

## [1.2.2] - 2026-11-18

### Changed

- Scenario 6: two commits rebased onto main by the merge queue (REBASE), no squash commit.

## [1.1.2] - 2026-11-18

### Changed

- Scenario 5: hotfix on the 1.1 line after 1.2.1; only the 1.1 alias may move.

## [1.2.1] - 2026-11-18

### Changed

- Scenario 4: the pull request's latest commit fails verification, so the merge must not be released.
- Scenario 5: the version line is restored and 1.2.1 is released, advancing `latest`, `1` and `1.2`.

## [1.2.0] - 2026-11-18

### Changed

- Scenario 3: competing pull request E for 1.2.0; only the merged one may be released.

## [1.1.1] - 2026-11-18

### Changed

- Scenario 2: two commits squashed by the merge queue into one release commit.

## [1.1.0] - 2026-11-18

### Added

- End-to-end verification of candidate build, scan, and digest promotion.
- A small Go HTTP server (`cmd/server`) as the test application, built in the
  `grootantech/toolkit` builder stage and run on `grootantech/micro-root`. Its version and
  marker identify which candidate a release promoted.
- Two Terraform roots, `infra/network` and `infra/storage`, scanned as a matrix so the
  release carries one Terraform scan summary per root.

### Changed

- The image is the test application instead of a copy of the toolkit image, and is
  published to `grootantech/playground` instead of the shared `grootantech/toolkit`.
- CI calls github-ci-library `1.9.2` instead of the deleted `dev` branch.

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
