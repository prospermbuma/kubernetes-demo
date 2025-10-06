set -e

NAME="kubernetes-demo-api"
USERNAME="prospermbuma"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE

echo "Applying Kubernetes configurations..."
kubectl apply -f k8s/

echo "Getting pod details..."
kubectl get pods

echo "Getting service details..."
kubectl get services

echo "Fetching the main service..."
kubectl get services $NAME-service

echo "Getting deployment details..."
kubectl get deployments

echo "Done!"