#!/bin/sh

INGRESS_IP=$(kubectl -n nginx-example get ingress myservices \
	-o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "Base"
curl -H 'Host: myserver.com' http://$INGRESS_IP/services/
echo "Service 1"
curl -H 'Host: myserver.com' http://$INGRESS_IP/services/service_1
echo "Service 2"
curl -H 'Host: myserver.com' http://$INGRESS_IP/services/service_2
