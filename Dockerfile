FROM golang:1.23-alpine AS build
WORKDIR /app
COPY src/ .
RUN go build -o server .

FROM alpine:3.21
COPY --from=build /app/server /server
EXPOSE 8080
ENTRYPOINT ["/server"]
