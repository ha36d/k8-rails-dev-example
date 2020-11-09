
# level 2.1

Setup a stack to monitor (Example: Grafana/Prometheus) and manage the logs (ELK)

Because of a bug in prometheus operator:

    kubectl delete crd prometheuses.monitoring.coreos.com
    kubectl delete crd prometheusrules.monitoring.coreos.com
    kubectl delete crd servicemonitors.monitoring.coreos.com
    kubectl delete crd podmonitors.monitoring.coreos.com
    kubectl delete crd alertmanagers.monitoring.coreos.com
    kubectl delete crd thanosrulers.monitoring.coreos.com
    kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/release-0.42/example/prometheus-operator-crd/monitoring.coreos.com_probes.yaml
    kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/release-0.42/example/prometheus-operator-crd/monitoring.coreos.com_prometheuses.yaml
    kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/release-0.42/example/prometheus-operator-crd/monitoring.coreos.com_prometheusrules.yaml
    kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/release-0.42/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml
    kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/release-0.42/example/prometheus-operator-crd/monitoring.coreos.com_podmonitors.yaml
    kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/release-0.42/example/prometheus-operator-crd/monitoring.coreos.com_alertmanagers.yaml
    kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/release-0.42/example/prometheus-operator-crd/monitoring.coreos.com_thanosrulers.yaml

and then install:

    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo add stable https://charts.helm.sh/stable
    helm repo update
    helm install prometheus prometheus-community/kube-prometheus-stack

and Installing ELK:

    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm install logstash bitnami/logstash -f k8s/logstash/values.yml

    helm repo add elastic https://Helm.elastic.co
    helm repo update
    helm install elasticsearch elastic/elasticsearch -f k8s/elasticsearch/values.yml

    helm install kibana elastic/kibana
