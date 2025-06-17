# مرحله 1: نصب Nginx و Tinyproxy روی Debian
FROM debian:bullseye-slim

# نصب Tinyproxy، Nginx و OpenSSL برای تولید گواهینامه
RUN apt-get update && \
    apt-get install -y nginx tinyproxy openssl && \
    apt-get clean

# کپی فایل تنظیمات Tinyproxy (در صورت نیاز تغییر دهید)
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# ایجاد گواهینامه SSL خودامضا
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/tinyproxy.key \
    -out /etc/nginx/ssl/tinyproxy.crt \
    -subj "/C=US/ST=Test/L=Test/O=Test/OU=Test/CN=localhost"

# کپی فایل تنظیمات Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# باز کردن پورت‌ها برای Tinyproxy و Nginx
EXPOSE 80 443

# راه‌اندازی Nginx و Tinyproxy
CMD ["/bin/sh", "-c", "service tinyproxy start && nginx -g 'daemon off;'"]
