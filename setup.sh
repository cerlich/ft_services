minikube stop
sleep 2
minikube delete
sleep 2
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
#minikube dashboard

eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f srcs/ips.yaml

#nginx
docker build -t nginx_image srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

#mysql
docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/mysql/sql.yaml
sleep 3
minikube dashboard