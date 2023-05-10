FROM golang:latest AS builder
COPY . /
RUN make build
FROM gcr.io/distroless/static:latest
LABEL maintainers="Ceph COSI Authors"
LABEL description="Ceph COSI driver"

COPY --from=builder ./bin/ceph-cosi-driver ceph-cosi-driver
ENTRYPOINT ["/ceph-cosi-driver"]
