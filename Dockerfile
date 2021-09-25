FROM golang:1.17-alpine

WORKDIR /app

COPY ./ /app

RUN go mod vendor
RUN go mod download
RUN go get github.com/githubnemo/CompileDaemon

ENTRYPOINT CompileDaemon --build="go build cmd/main.go" --command="./main"
