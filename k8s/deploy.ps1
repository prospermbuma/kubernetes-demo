# ============================================
# 🚀 Kubernetes Deployment Script (PowerShell)
# ============================================

# Stop execution on any error
$ErrorActionPreference = "Stop"

# --- Variables ---
$NAME = "kubernetes-demo-api"
$USERNAME = "prospermbuma"
$IMAGE = "$USERNAME/$NAME"

Write-Host "Building Docker image..." -ForegroundColor Cyan
docker build -t $IMAGE .

Write-Host "`nPushing Docker image to Docker Hub..." -ForegroundColor Cyan
docker push $IMAGE

Write-Host "`nApplying Kubernetes configurations..." -ForegroundColor Cyan
kubectl apply -f k8s/

Write-Host "`nGetting pod details..." -ForegroundColor Cyan
kubectl get pods

Write-Host "`nGetting service details..." -ForegroundColor Cyan
kubectl get services

Write-Host "`nFetching the main service..." -ForegroundColor Cyan
kubectl get services "$NAME-service"

Write-Host "`nGetting deployment details..." -ForegroundColor Cyan
kubectl get deployments

Write-Host "`nDone, Your application is deployed!" -ForegroundColor Green