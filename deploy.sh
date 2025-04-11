#!/bin/bash

set -e

echo "📦 Building WAR..."
mvn clean package -DskipTests

echo "🐳 Building & starting container via podman-compose..."
podman-compose down || true  # in case it's already running
podman-compose up -d --build

echo "✅ App is live at http://<your-public-ip>:8080/"
