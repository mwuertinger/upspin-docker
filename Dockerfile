FROM golang:1.11
RUN go get upspin.io/...
RUN CGO_ENABLED=0 go install upspin.io/cmd/upspinserver

FROM alpine:latest
RUN apk update && apk add ca-certificates shadow libcap && rm -rf /var/cache/apk/*
RUN groupadd -g 1000 upspin
RUN useradd -u 1000 -g 1000 -d / upspin
RUN mkdir /upspin && chown upspin:upspin /upspin
COPY --from=0 go/bin/upspinserver /upspinserver
RUN setcap 'cap_net_bind_service=+ep' /upspinserver # Allow server to bind privileged ports

USER upspin
ENTRYPOINT ["/upspinserver"]
