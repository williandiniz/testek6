FROM golang:1-alpine as builder
WORKDIR $GOPATH/src/github.com/loadimpact/k6
ADD . .
RUN apk --no-cache add --virtual .build-deps git make build-base &&
go get . && CGO_ENABLED=0 go install -a -ldflags ‘-s -w
