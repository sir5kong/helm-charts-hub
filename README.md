# Helm Charts Hub

本站提供热门 Kubernetes Helm Charts 资源聚合和网络加速，使用国内 CDN 发布，涵盖 Helm 仓库和文档资源。

!!! info
    国内访问 GitHub 网速比较慢，有时甚至访问不了。除非你引用本地 `Chart`，否则每次使用 `helm install`、 `helm upgrade` 都需要联网，网络不好会相当难受。

## 站点链接

- [中国站](https://helm-charts.itboon.top/docs/)
- [GitHub Pages](https://sir5kong.github.io/helm-charts-hub/)

## 添加仓库

``` shell
helm repo add bitnami "https://helm-charts.itboon.top/bitnami" --force-update
helm repo add grafana "https://helm-charts.itboon.top/grafana" --force-update
helm repo add prometheus-community "https://helm-charts.itboon.top/prometheus-community" --force-update
helm repo add ingress-nginx "https://helm-charts.itboon.top/ingress-nginx" --force-update
helm repo update
```

## 测试网速

敲下面的命令看是否流畅:

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

## 镜像源

- [Bitnami](https://github.com/bitnami/charts)
- [Prometheus Community](https://github.com/prometheus-community/helm-charts)
- [Grafana](https://github.com/grafana/helm-charts)
- [Ingress Nginx](https://github.com/kubernetes/ingress-nginx/)
