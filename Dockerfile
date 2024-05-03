FROM golang:alpine3.19 as buildStage
#FROM golang:alpine3.1

WORKDIR /

COPY . .

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM alpine:latest

WORKDIR /

ENV HOST=localhost DBPORT=5432
ENV USER=root PASSWORD=root DBNAME=root

COPY --from=buildStage /main .

RUN apk --no-cache add ca-certificates tzdata

EXPOSE 8080

CMD ["./main"]
