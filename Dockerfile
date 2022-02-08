FROM loadimpact/k6
RUN apk add --no-cache ca-certificates
RUN cp /go/bin/k6 /usr/bin/k6 && \ #FAILS in either case
mkdir /k6-tests
ADD src/ /k6-tests/
WORKDIR /k6-tests
ENTRYPOINT [“k6”]
CMD [“run”, “index.js”]
