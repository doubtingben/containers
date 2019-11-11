FROM golang:1.13 AS builder
RUN go get github.com/cloudflare/cloudflared/cmd/cloudflared \
    && go install github.com/cloudflare/cloudflared/cmd/cloudflared

FROM gcr.io/distroless/base
COPY --from=builder /go/bin/cloudflared /usr/local/bin/
ENTRYPOINT ["cloudflared", "--no-autoupdate"]
CMD ["version"]
