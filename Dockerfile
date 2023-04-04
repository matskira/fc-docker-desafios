#BUILD GO COMPILER
FROM golang AS builder
WORKDIR /usr/src/app/
COPY ./go .
RUN go build -ldflags "-s -w" hello.go

#BUILD SCRATCH
FROM scratch
WORKDIR /usr/src/app/
COPY --from=builder /usr/src/app/hello .
ENTRYPOINT [ "./hello" ]