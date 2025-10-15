#!/bin/bash

# Update & install Apache
apt-get update -y
apt-get install -y apache2

# Allow Apache in the firewall
ufw allow 'Apache Full'

# Clean up old content
rm -f /var/www/html/index.php
rm -f /var/www/html/index.html

# Get VM hostname (instance name)
HOSTNAME=$(hostname)

# Create a custom HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Azure VMSS - $HOSTNAME</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      text-align: center;
      padding-top: 100px;
      background: linear-gradient(135deg, #e0eafc, #cfdef3);
      color: #2c3e50;
    }
    h1 {
      font-size: 36px;
      margin-bottom: 20px;
    }
    p {
      font-size: 20px;
      color: #34495e;
    }
    .hostname {
      font-weight: bold;
      color: #2980b9;
    }
  </style>
</head>
<body>
  <h1>Your app is live on Azure VMSS!</h1>
  <p>Welcome to instance: <span class="hostname">$HOSTNAME</span></p>
</body>
</html>
EOF

# Restart Apache to load new content
systemctl restart apache2
