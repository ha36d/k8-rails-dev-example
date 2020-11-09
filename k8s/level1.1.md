
Create a new helm chart to deploy the application. (no need for external DB, use sqlite)

    mkdir -p k8s
    helm create k8s/app
    eval $(minikube docker-env)
    docker build -t app . -f dev.Dockerfile
    cat <<EOT >> config/secrets.yml
    development:
      secret_key_base:  $(openssl rand -base64 15 | tr -d '\n')
    EOT

Deploy the chart to the local Kubernetes cluster.

    minikube mount $(pwd):/vm-home &
    helm upgrade --install app k8s/app/

We should be able to access the application through an url

Make sure an ingress (like nginx) is installed:

    kubectl get pods | grep web | awk {'print $1'} | xargs -I {}  kubectl port-forward {} 3000:3000;
    http://127.0.0.1:3000/


In the first time in the app:

Creating sqlite file:

    kubectl get pods | grep web | awk {'print $1'} | xargs -I {}  kubectl exec -ti {} -- rake db:create;

Migration:

    kubectl get pods | grep web | awk {'print $1'} | xargs -I {}  kubectl exec -ti {} -- rake db:migrate;
