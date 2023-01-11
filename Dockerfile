# Stage 1: build
FROM golang:alpine AS builder
WORKDIR /go/src/
COPY hello.go hello.go
RUN GOOS=linux go build hello.go
ENTRYPOINT ["./hello"]

# Stage 2: execute
FROM scratch
COPY --from=builder /go/src .
ENTRYPOINT ["./hello"]
