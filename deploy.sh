#!/bin/bash
set -e # Exit on any error
VERSION=$1
echo "[DEPLOY] Starting deployment of version $VERSION"
# Replace placeholders in HTML
sed -i "s/BUILD_VERSION_PLACEHOLDER/$VERSION/g" webapp/index.html
sed -i "s/DEPLOY_TIME_PLACEHOLDER/$(date)/g" webapp/index.html
# Copy to web server
sudo cp webapp/index.html /var/www/html/index.html
sudo sytemctl restart httpd || sudo sytemctl restart apache2
echo "[DEPLOY] Deployment v$VERSION complete!"
echo "[DEPLOY] App running at http://$curl -s
http://169.254.169.254/ltest/meta-data/public-ipv4)"
