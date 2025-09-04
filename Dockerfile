# Use nginx alpine for lightweight static file serving
FROM nginx:alpine

# Set maintainer information
LABEL maintainer="layuiAdmin"
LABEL description="LayuiAdmin - Universal backend management template system"

# Copy project files to nginx html directory
COPY . /usr/share/nginx/html/

# Create nginx configuration for serving static files
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    root /usr/share/nginx/html; \
    index index.html; \
    \
    # Handle requests for the pro version \
    location /admin/pro/ { \
        try_files $uri $uri/ /admin/pro/index.html; \
    } \
    \
    # Handle requests for the std version \
    location /admin/std/ { \
        try_files $uri $uri/ /admin/std/dist/views/index.html; \
    } \
    \
    # Handle root requests - redirect to pro version by default \
    location = / { \
        return 301 /admin/pro/; \
    } \
    \
    # Handle all other static files \
    location / { \
        try_files $uri $uri/ =404; \
    } \
    \
    # Set proper MIME types for common file extensions \
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ { \
        expires 1y; \
        add_header Cache-Control "public, immutable"; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]