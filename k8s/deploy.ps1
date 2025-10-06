# ============================================
# 🚀 Kubernetes Deployment Script (PowerShell)
# ============================================

# Stop execution on any error
$ErrorActionPreference = "Stop"

# --- Variables ---
$NAME = "kubernetes-demo-api"
$USERNAME = "prospermbuma"
$IMAGE = "$USERNAME/$NAME:latest"

Write-Host "🔨 Building Docker image..." -ForegroundColor Cyan
docker build -t $IMAGE .

Write-Host "📤 Pushing Docker image to Docker Hub..." -ForegroundColor Cyan
docker push $IMAGE

Write-Host "📦 Applying Kubernetes configurations..." -ForegroundColor Cyan
kubectl apply -f k8s/

Write-Host "`n📊 Getting pod details..." -ForegroundColor Cyan
kubectl get pods

Write-Host "`n🌐 Getting service details..." -ForegroundColor Cyan
kubectl get services

Write-Host "`n🔎 Fetching the main service..." -ForegroundColor Cyan
kubectl get services "$NAME-service"

Write-Host "`n📦 Getting deployment details..." -ForegroundColor Cyan
kubectl get deployments

Write-Host "`n✅ Done! Your application is deployed." -ForegroundColor Green