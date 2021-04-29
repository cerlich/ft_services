minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
minikube ssh 'sudo mkdir /mnt/influxdb; sudo chmod 777 /mnt/influxdb'
#minikube dashboard

eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
minikube addons enable metallb
kubectl apply -f srcs/configmap.yaml

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

#ftps
docker build -t ftps_image srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

#influxdb
docker build -t influxdb_image srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml

#grafana
docker build -t grafana_image srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml

minikube dashboard