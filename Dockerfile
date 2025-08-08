FROM alpine:latest

WORKDIR /app

# 复制 PocketBase 文件
COPY pocketbase /app/pocketbase

# 给可执行权限
RUN chmod +x /app/pocketbase

# 启动 PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8080"]
