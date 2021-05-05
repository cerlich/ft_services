eval $(minikube docker-env)
kubectl exec deploy/wordpress-deployment -- pkill nginx
kubectl exec deploy/phpmyadmin-deployment -- pkill nginx
kubectl exec deploy/nginx-deployment -- pkill nginx
kubectl exec deploy/mysql -- pkill mysqld
kubectl exec deploy/mysql -- pkill telegraf
kubectl exec deploy/influxdb -- pkill influxd
kubectl exec deploy/grafana-deployment -- pkill grafana
kubectl exec deploy/ftps-deployment -- pkill vsftpd
kubectl exec deploy/ftps-deployment -- pkill telegraf