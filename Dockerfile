FROM ubuntu:latest

WORKDIR /app

EXPOSE 8000

ENV HOST=localhost PORT=5432
ENV USER=root PASSWORD=root DBNAME=root

COPY ./main main

CMD ["./main"]