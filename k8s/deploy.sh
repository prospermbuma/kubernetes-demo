set -e

NAME="kubernetes-demo-api"
USERNAME="prospermbuma"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo -e "\nPushing Docker image to Docker Hub..."
docker push $IMAGE

echo -e "\nApplying Kubernetes configurations..."
kubectl apply -f k8s/

echo -e "\nGetting pod details..."
kubectl get pods

echo -e "\nGetting service details..."
kubectl get services

echo -e "\nFetching the main service..."
kubectl get services $NAME-service

echo -e "\nGetting deployment details..."
kubectl get deployments

echo -e "\n Done, Your application is deployed!🎉"