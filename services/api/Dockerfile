# renovate: datasource=docker depName=redhat/ubi9-minimal versioning=redhat
ARG BASE_IMAGE_TAG=9.8-1789546276
ARG BASE_IMAGE_REPO=redhat/ubi9-minimal

FROM ${BASE_IMAGE_REPO}:${BASE_IMAGE_TAG}

ARG SERVICE_NAME=api
LABEL org.opencontainers.image.title="toolkit-${SERVICE_NAME}"

COPY app.sh /usr/local/bin/app.sh

USER 10001:10001
ENTRYPOINT ["/usr/local/bin/app.sh"]
