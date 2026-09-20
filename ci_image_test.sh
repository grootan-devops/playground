#!/usr/bin/env bash

set -ex

# Base OS / System Tools
curl --version
zip -v
unzip -v
gzip --version
tar --version
wget --version
openssl version
jq --version
yq --version
make --version
which which
less --version
# shellcheck disable=SC2185 # a version probe, not a search
find --version
diff --version
patch --version

# Networking / SSH
ssh -V
sshpass -V
s-nail --version
rsync --version

# Development / Python 3.12 & uv
git --version
python3.12 --version
python3 --version
python --version
uv --version
uvx --version

# Ensure strict Python 3.12.y
python3 --version | grep -E "^Python 3\.12\."
python --version | grep -E "^Python 3\.12\."

# Verify pip is NOT installed
if which pip || which pip3 || which pip3.12 || which pip3.9; then
  echo "Error: pip should not be installed" >&2
  exit 1
fi

# Linters / Formatters
yamllint --version
ansible-lint --version
pycodestyle --version
isort --version
mypy --version
ruff --version
biome --version
hadolint --version
actionlint -version
shellcheck --version

# Infrastructure / Cloud / Security
terraform version
tofu version
terraform-docs --version
tflint --version
ansible --version
trivy --version
betterleaks --version

# Containers / Kubernetes
docker --version
docker buildx version
podman --version
buildah --version
helm version
helm-docs --version
helm unittest --help
kubectl version --client=true
argocd version --client
release-cli --version
crane version

# Golang & Go Tools
go version
swag --version
gosec --version
golangci-lint --version

# Java & Maven
java --version
java --version 2>&1 | head -n1 | grep -E "^openjdk 25\."
javac --version 2>&1 | grep -E "^javac 25\."
mvn --version
mvn --version 2>&1 | grep -E "^Java version: 25\."

# Node.js 24 & NPM / Yarn
node --version
node --version | grep -E "^v24\."
npm --version
npx --version
yarn --version
yarnpkg --version
corepack --version
