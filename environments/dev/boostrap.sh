#!/bin/bash

# Update package lists and install Nginx based on the OS
if command -v apt-get &> /dev/null; then
    # Ubuntu / Debian configuration
    export DEBIAN_FRONTEND=noninteractive
    apt-get update -y
    apt-get install -y nginx
elif command -v yum &> /dev/null; then
    # Amazon Linux 2 / 2023 / RHEL / CentOS configuration
    yum update -y
    yum install -y nginx
else
    echo "Unsupported operating system" >&2
    exit 1
fi

# Enable Nginx to start automatically on system boot
systemctl enable nginx

# Start the Nginx web service immediately
systemctl start nginx

# Optional: Create a custom landing page to verify it works
echo "<h1>Hello World from Nginx via Terraform User Data!</h1>" > /var/www/html/index.html
