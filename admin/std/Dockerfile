FROM nginx

RUN rm /etc/nginx/conf.d/default.conf

ADD deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY dist/ /usr/share/nginx/html/

# docker build -t swr.cn-north-4.myhuaweicloud.com/liuxinhh/layui-admin-std:latest .
# docker push swr.cn-north-4.myhuaweicloud.com/liuxinhh/layui-admin-std:latest