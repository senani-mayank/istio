# istio
istio examples and resources

* istioctl 1.8.3 binary: https://github.com/istio/istio/releases/tag/1.8.3
* minikube install:  https://minikube.sigs.k8s.io/docs/start/
* minikube istio: https://istio.io/latest/docs/setup/platform-setup/minikube/
* minikube start:  "minikube start --driver=virtualbox --kubernetes-version=1.16.0 --cpus 4 --memory 6144"
* install istio:  istioctl install
* destory minikube minikube delete --purge
* get ingress address with following address
```

function istioctl_proxy_address() {
    minikube_ip=`minikube ip`
    ingress_80_port=`kubectl -n istio-system get svc | grep istio-ingressgateway | awk '{print $5}' |  tr ',' '\n' | grep "80:" | tr ':' ' ' | tr '/TCP' ' ' | awk '{print $2}'`
    echo http://${minikube_ip}:${ingress_80_port}
}
 
```
* https://istio.io/latest/docs/tasks/policy-enforcement/rate-limit/#:~:text=Envoy%20supports%20local%20rate%20limiting,traffic%20through%20the%20productpage%20service.