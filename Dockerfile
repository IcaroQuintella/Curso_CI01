FROM golang:alpine3.19 as buildStage

WORKDIR /app

COPY . .

RUN go build -o main .

FROM alpine:latest

WORKDIR /app

COPY --from=buildStage /app/main .

EXPOSE 8000

ENV HOST=localhost PORT=5432
ENV USER=root PASSWORD=root DBNAME=root

CMD ["/app/main"]
