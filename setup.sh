minikube start --vm-driver=virtualbox
minikube dashboard
minikube addons enable metallb
eval $(minikube docker-env)
#cd srcs/nginx && docker build -t nginx_image . && kubectl apply -f nginx.yaml
#cd .. && kubectl apply -f ips.yaml