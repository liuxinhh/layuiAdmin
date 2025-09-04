# Docker 使用说明

本项目已经包含了 Dockerfile，可以方便地使用 Docker 来部署和运行 layuiAdmin。

## 构建 Docker 镜像

```bash
docker build -t layuiadmin .
```

## 运行容器

```bash
# 运行容器，映射到本地 8080 端口
docker run -d -p 8080:80 --name layuiadmin layuiadmin

# 或者运行在其他端口，比如 3000
docker run -d -p 3000:80 --name layuiadmin layuiadmin
```

## 访问应用

启动容器后，可以通过以下地址访问应用：

- **专业版 (推荐)**: http://localhost:8080/admin/pro/
- **标准版**: http://localhost:8080/admin/std/dist/views/index.html
- **根目录**: http://localhost:8080/ (自动重定向到专业版)

## 容器管理

```bash
# 查看运行状态
docker ps

# 停止容器
docker stop layuiadmin

# 启动容器
docker start layuiadmin

# 删除容器
docker rm layuiadmin

# 删除镜像
docker rmi layuiadmin

# 使用 docker compose 停止
docker compose down
```

## 镜像特性

- 基于轻量级的 `nginx:alpine` 镜像
- 自动配置 nginx 服务器
- 支持静态文件缓存优化
- 默认端口 80
- 自动处理路由重定向

## 生产部署建议

在生产环境中建议：

1. 使用 docker-compose 进行管理
2. 配置适当的健康检查
3. 设置合适的重启策略
4. 考虑使用 nginx 反向代理

### docker-compose.yml 示例

```yaml
services:
  layuiadmin:
    build: .
    ports:
      - "80:80"
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "wget", "--quiet", "--tries=1", "--spider", "http://localhost/admin/pro/"]
      interval: 30s
      timeout: 10s
      retries: 3
```

运行：
```bash
docker compose up -d
```