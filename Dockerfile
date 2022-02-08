FROM golang:1-alpine AS builder
RUN apk --no-cache add --virtual .build-deps git make build-base
RUN go get "github.com/loadimpact/k6"
WORKDIR $GOPATH/src/github.com/loadimpact/k6
ADD . .
RUN go get . && CGO_ENABLED=0 go install -a -ldflags '-s -w'

FROM alpine:3.9
COPY --from=builder /go/bin/k6 /usr/bin/k6
