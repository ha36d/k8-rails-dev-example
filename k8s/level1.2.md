
- Install a DB and object storage of your choice and configure the application to use these.

Deploy the chart to the local Kubernetes cluster.

    minikube mount $(pwd):/vm-home &
    helm upgrade --install app k8s/app/

In the first time in the app:

Creating sqlite file:

    kubectl get pods | grep web | awk {'print $1'} | xargs -I {}  kubectl exec -ti {} -- rake db:create;

Migration:

    kubectl get pods | grep web | awk {'print $1'} | xargs -I {}  kubectl exec -ti {} -- rake db:migrate;


minIO

      helm repo add minio https://helm.min.io/
      helm install minio --set persistence.size=1Gi,resources.requests.memory=1G,accessKey=myaccesskey,secretKey=mysecretkey minio/minio
