FROM golang:1.24-alpine AS build

ARG MINIOSOFT_REF=master
RUN apk add --no-cache git
WORKDIR /src
RUN git clone --depth 1 --branch "$MINIOSOFT_REF" https://github.com/Dargianz/miniosoft.git . \
    && go mod download \
    && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -trimpath -ldflags "-s -w" -o /out/miniosoft .

FROM alpine:3.22
RUN apk add --no-cache ca-certificates tini \
    && addgroup -S miniosoft \
    && adduser -S -G miniosoft miniosoft \
    && mkdir -p /data \
    && chown -R miniosoft:miniosoft /data
COPY --from=build /out/miniosoft /usr/bin/miniosoft
RUN chmod 0755 /usr/bin/miniosoft
USER miniosoft
WORKDIR /data
VOLUME ["/data"]
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/miniosoft"]
CMD ["server", "/data", "--address", ":9000", "--console-address", ":9001"]
