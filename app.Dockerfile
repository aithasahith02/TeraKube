FROM nginx:latest
COPY ./k8s/index.html /usr/share/nginx/html/index.html

