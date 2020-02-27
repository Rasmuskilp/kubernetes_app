
# This part is for kubernetes
https://kubernetes.io/docs/tutorials/kubernetes-basics/create-cluster/cluster-intro/
## Cluster
"Kubernetes coordinates a highly available cluster of computers that are connected to work as a single unit. "
Kubernetes coordinates a highly available cluster of computers that are connected to work as a single unit
A node is a VM or a physical computer that serves as a worker machine in a Kubernetes cluster.
he nodes communicate with the master using the Kubernetes API,
## Serivces
 Service in Kubernetes is an abstraction which defines a logical set of Pods and a policy by which to access them. Services enable a loose coupling between dependent Pods.
 NodePort - Exposes the Service on the same port of each selected Node in the cluster using NAT. Makes a Service accessible from outside the cluster using <NodeIP>:<NodePort>. Superset of ClusterIP.
## Pods
A Pod is a Kubernetes abstraction that represents a group of one or more application containers (such as Docker or rkt), and some shared resources for those containers. Those resources include:

Shared storage, as Volumes
Networking, as a unique cluster IP address
Information about how to run each container, such as the container image version or specific ports to use
Pods are the atomic unit on the Kubernetes platform
## Nodes
A Pod always runs on a Node. A Node is a worker machine in Kubernetes and may be either a virtual or a physical machine, depending on the cluster. Each Node is managed by the Master
## Deployments
Once you have a running Kubernetes cluster, you can deploy your containerized applications on top of it. To do so, you create a Kubernetes Deployment configuratio
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
#These are instructions oh how to run an app deployment with kubernetes
##Assumes you have a prebuild docker image
##First you need to proxy to get deployment
kubectl proxy --port=3000
#to show deployments
kubectl get deployments
# to show node
kubectl get nodes
#to show pods
kubectl get pods
#to get detailed information on pods
kubectl describe pods
#to set a generic name for the deployment
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
curl http://localhost:3000/api/v1/namespaces/default/pods/$POD_NAME
#to get logs of the pod
kubectl logs $POD_NAME
#to set env variable  for the pod
kubectl exec $POD_NAME env
#to execute commands in bash inside the pod
 kubectl exec -ti $POD_NAME bash
# to got to localhost:3000 inside the pod
curl localhost:3000
#to show services
kubectl get services
#to expose the pods with nodeport service to outside of minikube
kubectl expose deployment/kubernetes-app  --type="NodePort" --port 3000
#to show information on the deployment/service
kubectl describe services/kubernetes-app
#to set generic name for the service
export NODE_PORT=$(kubectl get services/kubernetes-app -o go-template='{{(index .spec.ports 0).nodePort}}')
#to get the pod at that ip
curl $(minikube ip):$NODE_PORT
# to label the pod
kubectl label pod $POD_NAME app=v1
# to run the service
kubectl get service run=app-kubernetes
# short version of deploying part of the app:
#to run the image
kubectl run web --image=gcr.io/google-samples/hello-app:1.0 --port=8080
#to expose the deployment to outside to that port and using that service
kubectl expose deployment web --target-port=8080 --type=NodePort
#to show the service
kubectl get service web
#to show on which url the service is running on
minikube service web --url
#now you can go to the url on that service and see the app working :)
