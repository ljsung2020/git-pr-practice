# 정적 페이지용 Nginx 기반 이미지
FROM nginx:alpine
COPY . /usr/share/nginx/html

