To deploy this repository:

```
kubectl apply -k .
```

This will create a namespace "nginx-example" and deploy into that resource:

- 3 deployments
- 3 services
- 3 configmaps
- 1 ingress

With this configuration deployed, if we run the following script:

```
#!/bin/sh

INGRESS_IP=$(kubectl -n nginx-example get ingress myservices \
	-o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "Base"
curl -H 'Host: myserver.com' http://$INGRESS_IP/services/
echo "Service 1"
curl -H 'Host: myserver.com' http://$INGRESS_IP/services/service_1
echo "Service 2"
curl -H 'Host: myserver.com' http://$INGRESS_IP/services/service_2
```

We will see this output:

```
Base
This is the base webservice.
Service1
This is service1.
Service2
This is service2.
```
