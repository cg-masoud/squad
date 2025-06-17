# Use the official Nginx base image
FROM nginx:alpine

# Copy SSL certificates (if needed)
COPY ssl/tinyproxy.crt /etc/nginx/ssl/tinyproxy.crt
COPY ssl/tinyproxy.key /etc/nginx/ssl/tinyproxy.key

# Copy the custom Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports 80 and 443 for HTTP and HTTPS traffic
EXPOSE 80 443

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
