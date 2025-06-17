FROM nginx:alpine

# حذف کانفیگ پیشفرض
RUN rm /etc/nginx/conf.d/default.conf

# کپی کانفیگ nginx
COPY nginx.conf /etc/nginx/conf.d/proxy.conf

EXPOSE 80
