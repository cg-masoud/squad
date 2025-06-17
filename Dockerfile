# انتخاب بیس ایمیج
FROM dannydirect/tinyproxy:latest

# نصب iptables
RUN apt-get update && apt-get install -y iptables && apt-get clean

# اضافه کردن قوانین iptables برای هدایت ترافیک پورت 80 به 8888
RUN iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8888

# اطمینان از اجرای iptables در زمان اجرای کانتینر
CMD ["sh", "-c", "iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8888 && tinyproxy -d"]
