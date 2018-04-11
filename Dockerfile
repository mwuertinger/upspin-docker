FROM golang:1.10
RUN go get upspin.io/...
RUN CGO_ENABLED=0 go install upspin.io/cmd/upspinserver

# FROM ubuntu:latest
FROM alpine:latest
COPY --from=0 go/bin/upspinserver /upspinserver
ENTRYPOINT ["/upspinserver"]
