FROM golang:1.24-alpine AS build

WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=$TARGETARCH go build -tags kqueue -trimpath -ldflags "-s -w" -o /out/minio .

FROM alpine:3.22
RUN apk add --no-cache ca-certificates tini && addgroup -S minio && adduser -S -G minio minio
COPY --from=build /out/minio /usr/bin/minio
COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod 0755 /usr/bin/minio /usr/bin/docker-entrypoint.sh && mkdir -p /data && chown -R minio:minio /data
USER minio
WORKDIR /data
VOLUME ["/data"]
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/docker-entrypoint.sh"]
CMD ["minio"]
