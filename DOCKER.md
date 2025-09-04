# Docker 使用说明 / Docker Usage

## 构建 Docker 镜像 / Build Docker Image

```bash
# 克隆仓库 / Clone repository
git clone https://github.com/liuxinhh/layuiAdmin.git
cd layuiAdmin

# 构建镜像 / Build image
docker build -t layui-admin .
```

## 运行容器 / Run Container

```bash
# 运行容器，映射到本地8080端口 / Run container, map to local port 8080
docker run -d -p 8080:80 --name layui-admin layui-admin

# 或者指定其他端口 / Or specify another port
docker run -d -p 3000:80 --name layui-admin layui-admin
```

## 访问应用 / Access Application

容器启动后，可以通过以下URL访问不同版本：
After the container starts, you can access different versions via these URLs:

- **iframe版本 / iframe Version**: `http://localhost:8080/admin/pro/`
- **单页版本 / Single Page Version**: `http://localhost:8080/admin/std/dist/views/`
- **主页面 / Home Page**: `http://localhost:8080/`

## 管理容器 / Container Management

```bash
# 查看运行中的容器 / View running containers
docker ps

# 停止容器 / Stop container
docker stop layui-admin

# 启动容器 / Start container
docker start layui-admin

# 删除容器 / Remove container
docker rm layui-admin

# 删除镜像 / Remove image
docker rmi layui-admin
```

## 特性 / Features

- ✅ 基于 nginx:alpine 轻量级镜像 / Based on lightweight nginx:alpine image
- ✅ 支持两个版本的 layuiAdmin / Supports both layuiAdmin versions
- ✅ 静态文件缓存优化 / Static file caching optimization
- ✅ Gzip 压缩启用 / Gzip compression enabled
- ✅ 安全头部配置 / Security headers configured
- ✅ 响应式布局支持 / Responsive layout support

## 技术配置 / Technical Configuration

- **Base Image**: nginx:alpine
- **Port**: 80 (可映射到任意本地端口 / can be mapped to any local port)
- **Web Server**: Nginx with optimized configuration
- **Compression**: Gzip enabled for static assets
- **Caching**: 1-year cache for static files