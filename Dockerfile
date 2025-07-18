# 构建阶段
FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go env -w GOPROXY=https://goproxy.cn,direct && go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /gin-demo

# 运行阶段
FROM alpine:latest
WORKDIR /app
COPY --from=builder /gin-demo /app/gin-demo
EXPOSE 8080
CMD ["/app/gin-demo"]
