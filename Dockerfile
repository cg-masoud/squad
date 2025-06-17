# Base image for Squid
FROM debian:latest

# Install Squid and NGINX
RUN apt-get update && apt-get install -y squid nginx && apt-get clean

# Copy Squid configuration
COPY squid.conf /etc/squid/squid.conf

# Copy NGINX configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Create necessary directories
RUN mkdir -p /etc/nginx/certs

# Expose Squid and NGINX ports
EXPOSE 80 443 3128

# Start both services
CMD service squid start && nginx -g "daemon off;"
