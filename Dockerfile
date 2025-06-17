FROM sameersbn/squid:latest

# افزودن کانفیگ Squid به داخل ایمیج
COPY squid.conf /etc/squid/squid.conf
