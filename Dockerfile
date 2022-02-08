FROM my-private-registry.com/k6:20190311_001
RUN apk add --no-cache ca-certificates
RUN cp /go/bin/k6 /usr/bin/k6 && \
    mkdir /k6-tests
ADD src/ /k6-tests/
WORKDIR /k6-tests
ENTRYPOINT ["k6"]
CMD ["run", "index.js"]
