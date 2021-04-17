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
kubectl apply -f srcs/mysql/mysql.yaml

#wordpress
docker build -t wordpress_image srcs/wordpress
kubectl apply -f srcs/wordpress/wp.yaml

#phpmyadmin
docker build -t phpmyadmin_image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/pma.yaml
#sleep 2
minikube dashboard