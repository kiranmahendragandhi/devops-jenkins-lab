#!/bin/bash
set -e # Exit on any error
VERSION=$1

# Ensure version argument is provided
if [ -z "$VERSION" ]; then
  echo "Error: No version provided. Usage: ./deploy.sh 1.0.0"
  exit 1
fi

echo "[DEPLOY] Starting deployment of version $VERSION"

# Replace placeholders in HTML
sed -i "s/BUILD_VERSION_PLACEHOLDER/$VERSION/g" webapp/index.html
sed -i "s|DEPLOY_TIME_PLACEHOLDER|$(date)|g" webapp/index.html

# Copy to web server
sudo cp webapp/index.html /var/www/html/index.html

# Fix typo: systemctl
sudo systemctl restart httpd || sudo systemctl restart apache2

echo "[DEPLOY] Deployment v$VERSION complete!"

# Fix typo: latest; Fix syntax: $(command substitution)
IP=$(curl -s http://169.254.169)
echo "[DEPLOY] App running at http://$IP"
