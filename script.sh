#!/bin/bash

# ----------------------------
# Replace BASE_URL in specific files
# ----------------------------
# Usage: ./replace_base_url.sh "https://new.url.com"
# ----------------------------

set -e

NEW_URL="$1"

if [[ -z "$NEW_URL" ]]; then
  echo "❌ Usage: $0 NEW_URL"
  exit 1
fi

echo "🔄 Replacing BASE_URL with: $NEW_URL"

NGINX_FILE="./nginx/default.var.conf"
NGINX_DEST="./nginx/default.conf"
# ----------------------------
# Replace in default.var.conf
# ----------------------------
if [[ -f "$NGINX_FILE" ]]; then
  cp "$NGINX_FILE" "$NGINX_DEST"
  sed -i  "s|__BASE_URL__|$NEW_URL|g" "$NGINX_DEST"
  echo "✅ Updated BASE_URL in default.var.conf"
else
  echo "⚠️  default.conf not found"
fi


ANGULAR_FILE="./angular.var.json"
ANGULAR_DEST="./angular.json"
# ----------------------------
# Replace in angular.var.json
# Format: "BASE_URL": "old-url"
# ----------------------------
if [[ -f "$ANGULAR_FILE" ]]; then
  cp "$ANGULAR_FILE" "$ANGULAR_DEST"
  sed -i  "s|__BASE_URL__|$NEW_URL|g" "$ANGULAR_DEST"
  echo "✅ Updated BASE_URL in angular.json"
else
  echo "⚠️  angular.var.json not found"
fi

echo "🎉 Done."