FROM ubuntu:latest

WORKDIR /app

EXPOSE 8000

COPY ./main main

CMD ["./main"]