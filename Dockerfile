FROM golang:alpine as build
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o fc-docker-go

FROM scratch
COPY --from=build /app/fc-docker-go /fc-docker-go
CMD ["/fc-docker-go"]