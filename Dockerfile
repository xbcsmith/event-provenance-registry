FROM golang:1.25-trixie AS builder

WORKDIR /build

ADD . .

RUN make clean && make linux

FROM scratch

COPY --from=builder /build/bin/epr-server /usr/local/bin/epr-server

CMD ["/usr/local/bin/epr-server"]
