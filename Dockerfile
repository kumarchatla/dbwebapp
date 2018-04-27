FROM golang
WORKDIR /go/src/github.com/neumayer/dbwebapp/
COPY vendor vendor
COPY main.go .
COPY vault.go .
COPY pinger.go .
RUN CGO_ENABLED=0 go build -o dbwebapp

FROM scratch
COPY --from=0 /go/src/github.com/neumayer/dbwebapp/dbwebapp .
EXPOSE 8080
ENTRYPOINT ["/dbwebapp"]
