FROM golang:alpine3.19 as buildStage
#FROM golang:alpine3.1

WORKDIR /

COPY . .

RUN go build -o main .

FROM alpine:latest

WORKDIR /

ENV HOST=10.40.0.12 DBPORT=5432
ENV USER=root PASSWORD=root DBNAME=root

COPY --from=buildStage /main .

EXPOSE 8080

CMD ["./main"]
