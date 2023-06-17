# Helm Charts Hub

本站提供热门 Kubernetes Helm Charts 资源聚合和网络加速，使用国内 CDN 发布，涵盖 Helm 仓库和文档资源。

!!! info
    国内访问 GitHub 网速比较慢，有时甚至访问不了。除非你引用本地 `Chart`，否则每次使用 `helm install`、 `helm upgrade` 都需要联网，网络不好会相当难受。

## 镜像资源

- [Bitnami Helm Charts](https://github.com/bitnami/charts)
- [Prometheus Community Kubernetes Helm Charts](https://github.com/prometheus-community/helm-charts)
- [Grafana Community Kubernetes Helm Charts](https://github.com/grafana/helm-charts)
- [Ingress-NGINX Controller for Kubernetes](https://github.com/kubernetes/ingress-nginx/)

## 添加仓库

``` shell
helm repo add bitnami "https://helm-charts.itboon.top/bitnami" --force-update
helm repo add grafana "https://helm-charts.itboon.top/grafana" --force-update
helm repo add grafana "https://helm-charts.itboon.top/prometheus-community" --force-update
helm repo add grafana "https://helm-charts.itboon.top/ingress-nginx" --force-update
helm repo update
```

### 测试网速

``` shell
helm repo add bitnami "https://helm-charts.itboon.top/bitnami" --force-update
helm repo update bitnami
helm template nginx bitnami/nginx
```

## 部署应用

``` shell
## 部署 nginx
helm upgrade --install nginx \
  --namespace chart-demo \
  --create-namespace \
  bitnami/nginx

## 部署 redis
helm upgrade --install redis \
  --namespace chart-demo \
  --create-namespace \
  --set master.persistence.enabled="false" \
  --set replica.replicaCount="1" \
  --set replica.persistence.enabled="false" \
  bitnami/redis

```

## 查看文档