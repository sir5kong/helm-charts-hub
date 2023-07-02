# commonapp helm chart

`commonapp` 适合部署常见单容器应用，比如 nginx、python、spring-boot 等。

## Prerequisites

- Kubernetes 1.18+
- Helm 3.3+

## 添加 helm 仓库

``` shell
## 添加 helm 仓库
helm repo add sir5kong https://helm-charts.itboon.top/sir5kong
helm repo update sir5kong
```

## 部署案例

### 部署 nginx

``` shell
helm upgrade --install nginx-demo \
  --namespace helm-demo \
  --create-namespace \
  --set nameOverride="grafana" \
  --set image.repository="nginx" \
  --set image.tag="latest" \
  sir5kong/commonapp
```


## Values

``` shell
helm show values sir5kong/commonapp
```

| Key | 类型 | 默认值 | 描述 |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Deployment Pod 副本数 |
| image.repository | string | `nginx` | 容器镜像仓库，例如: `docker.io/kennethreitz/httpbin` |
| image.tag | string | `latest` | 容器镜像 tag，例如: `latest`、`v1.0.0` |
| containerPort | int | `80` | 容器端口 |
| service.port | int | `80` | Service 端口 |
| ingress.enabled | bool | `false` | 是否创建 Ingress |
| resources | object | `{}` |  |
| livenessProbe | object | `{}` |  |
| readinessProbe | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| affinity | object | `{}` |  |
| tolerations | list | `[]` |  |
| env | list | `[]` | 容器环境变量 |
| command | list | `[]` | 容器启动命令 |
| args | list | `[]` | 容器启动参数 |

### Values 案例

``` yaml
nameOverride: nginx

image:
  repository: nginx
  tag: 1.25-alpine

containerPort: 80

livenessProbe:
  initialDelaySeconds: 60
  failureThreshold: 5
  periodSeconds: 10
  httpGet:
    path: /
    port: http

readinessProbe:
  failureThreshold: 3
  periodSeconds: 5
  httpGet:
    path: /
    port: http

resources:
  limits:
    cpu: 500m
    memory: 2Gi
  requests:
    cpu: 20m
    memory: 128Mi
```
