#!/bin/bash

set -e

echo "📦 Building WAR..."
mvn clean package -DskipTests

echo "🐳 Building container..."
podman build -t my-jsp-app:latest .

echo "🧹 Cleaning up previous container..."
podman stop my-jsp-app 2>/dev/null || true
podman rm my-jsp-app 2>/dev/null || true

echo "🚀 Starting new container..."
podman run -d --name my-jsp-app -p 80:8080 my-jsp-app:latest

echo "✅ App is live at http://54.198.38.100/"
