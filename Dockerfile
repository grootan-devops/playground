# The playground's test application. docker.yml passes TOOLKIT_BUILD_IMAGE,
# MICRO_ROOT_BASE_IMAGE and VERSION (the candidate image tag) as build args.
ARG TOOLKIT_BUILD_IMAGE=grootantech/toolkit:2.1.0
ARG MICRO_ROOT_BASE_IMAGE=grootantech/micro-root:1.2.0

# docker.yml does not hand build artifacts to the image job, so the binary is
# built here, in the organisation build container (docs/docker.md, multi-stage).
FROM ${TOOLKIT_BUILD_IMAGE} AS builder

ARG VERSION=dev

WORKDIR /src

COPY go.mod ./
COPY cmd/ cmd/

RUN CGO_ENABLED=0 GOTOOLCHAIN=local go build -trimpath \
      -ldflags "-s -w -X main.Version=${VERSION}" \
      -o /out/playground ./cmd/server

FROM ${MICRO_ROOT_BASE_IMAGE}

USER 0

WORKDIR /app

COPY --from=builder --chown=10001:10001 /out/playground /app/playground

USER 10001:10001

EXPOSE 8080

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/app/playground"]
