
# This part is for kubernetes

[18:17] Rasmus Kilp
    $ minikube start --vm-driver=hyperv --kubernetes-version 1.14.8
​[18:17] Rasmus Kilp
    to run minikube
​[18:17] Rasmus Kilp
    (my kubernetes version for docker was 1.14.8)
​[18:17] Rasmus Kilp
    then you can to minikube dashboard
​[18:18] Rasmus Kilp
    $ kubectl run rasmus-upn --image=docker
​[18:18] Rasmus Kilp
    to run the image
​[18:18] Rasmus Kilp
    (my image was named rasmus-upn)
​[18:19] Rasmus Kilp
    also, to note, as containers automatically exit when bash script is run, kubernetes will say the status of the thing is crash or what not
​[18:19] Rasmus Kilp
    if you do : $ kubectl get pods
​[18:19] Rasmus Kilp
    $ kubectl expose deployment rasmus-upn
    [18:19] Rasmus Kilp
        and kubectl get svc
    ​[18:19] Rasmus Kilp
        to show ip (though it is local anyway)
    ​[18:20] Rasmus Kilp
        $ kubectl expose deployment rasmus-upn --port=8080
