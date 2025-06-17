FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    squid nginx supervisor openssl \
    && rm -rf /var/lib/apt/lists/*

# ساخت پوشه ssl
RUN mkdir -p /etc/nginx/ssl

# ساخت Self-Signed Certificate و Key
RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=localhost" \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/selfsigned.key \
    -out /etc/nginx/ssl/selfsigned.crt

# کپی کانفیگ‌ها
COPY nginx.conf /etc/nginx/nginx.conf
COPY squid.conf /etc/squid/squid.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# حذف پیشفرض nginx
RUN rm /etc/nginx/sites-enabled/default

EXPOSE 80 443 3128

CMD ["/usr/bin/supervisord", "-n"]
