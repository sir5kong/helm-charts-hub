# Prometheus Postgres Exporter

Prometheus exporter for [PgBouncer](https://www.pgbouncer.org/) server metrics.

This chart bootstraps a prometheus [pgbouncer exporter](https://github.com/prometheus-community/pgbouncer_exporter) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.16+
- Helm 3+

## Add Helm Chart Repository

```console
helm repo add prometheus-community-mirror https://helm-charts.itboon.top/prometheus-community
helm repo update
```

_See [`helm repo`](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
helm install [RELEASE_NAME] prometheus-community-mirror/prometheus-pgbouncer-exporter
```

_See [configuration](#configuring) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Configuring

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments, visit the chart's [values.yaml](./values.yaml), or run these configuration commands:

```console
helm show values prometheus-community-mirror/prometheus-pgbouncer-exporter
```
