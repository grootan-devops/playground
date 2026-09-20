# Changelog

All notable changes to this project are documented in this file. The format is
based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this
project follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
