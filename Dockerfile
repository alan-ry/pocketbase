# 使用一个轻量的官方 Go 镜像作为基础
# 你也可以用 alpine，但用 golang 可以方便未来可能需要的构建步骤
FROM golang:1.21-alpine

# 设置 PocketBase 版本号
ARG PB_VERSION=0.22.18

# 设置工作目录
WORKDIR /app

# 下载并解压 PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN apk add --no-cache unzip && \
    unzip /tmp/pb.zip -d /app && \
    rm /tmp/pb.zip

# 暴露 PocketBase 的默认端口
EXPOSE 8090

# 启动命令
# --dir 指定数据目录，我们将它指向持久化存储卷挂载的目录
# --http 监听所有网络接口的 8090 端口
CMD ["./pocketbase", "serve", "--dir=/app/pb_data", "--http=0.0.0.0:8090"]
