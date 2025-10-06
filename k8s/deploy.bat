@echo off
REM === Stop execution if any command fails ===
setlocal enabledelayedexpansion

set NAME=kubernetes-demo-api
set USERNAME=prospermbuma
set IMAGE=%USERNAME%/%NAME%:latest

echo Building Docker image...
docker build -t %IMAGE% .

if %ERRORLEVEL% neq 0 (
    echo ❌ Docker build failed!
    exit /b %ERRORLEVEL%
)

echo Pushing Docker image to Docker Hub...
docker push %IMAGE%

if %ERRORLEVEL% neq 0 (
    echo ❌ Docker push failed!
    exit /b %ERRORLEVEL%
)

echo Applying Kubernetes configurations...
kubectl apply -f k8s/

if %ERRORLEVEL% neq 0 (
    echo ❌ kubectl apply failed!
    exit /b %ERRORLEVEL%
)

echo Getting pod details...
kubectl get pods

echo Getting service details...
kubectl get services

echo Fetching the main service...
kubectl get services %NAME%-service

echo Getting deployment details...
kubectl get deployments

echo ✅ Done!
pause
