#!/bin/bash
# Update the system packages
dnf update -y

# Install Nginx
dnf install -y nginx

# Start the Nginx service immediately
systemctl start nginx

# Enable Nginx to automatically start on system boot
systemctl enable nginx

# Optional: Create a custom test page
echo "<h1>Hello, this is Shreyash's Terraform project!</h1><img src='https://t3.ftcdn.net/jpg/15/84/34/90/360_F_1584349015_6BwY5z1ju0bWKfsJGUJ4nGTqFI7NtC8O.jpg' alt='Terraform Project Image'>" > /usr/share/nginx/html/index.html
