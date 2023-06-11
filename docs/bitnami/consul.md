<!--- app-name: HashiCorp Consul -->

# HashiCorp Consul packaged by Bitnami

HashiCorp Consul is a tool for discovering and configuring services in your infrastructure.

[Overview of HashiCorp Consul](https://consul.io)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/consul
```

## Introduction

This chart bootstraps a [HashiCorp Consul](https://github.com/bitnami/containers/tree/main/bitnami/consul) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/consul
```

These commands deploy HashiCorp Consul on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release. Remove also the chart using `--purge` option:

```console
helm delete --purge my-release
```

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Common parameters

| Name                     | Description                                                                             | Value           |
| ------------------------ | --------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Override Kubernetes version                                                             | `""`            |
| `nameOverride`           | String to partially override common.names.fullname                                      | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname                                          | `""`            |
| `commonLabels`           | Labels to add to all deployed objects (sub-charts are not considered)                   | `{}`            |
| `commonAnnotations`      | Annotations to add to all deployed objects (sub-charts are not considered)              | `{}`            |
| `clusterDomain`          | Kubernetes cluster domain name                                                          | `cluster.local` |
| `extraDeploy`            | Array of extra objects to deploy with the release                                       | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`         |
| `diagnosticMode.command` | Command to override all containers in the deployment                                    | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                       | `["infinity"]`  |

### HashiCorp Consul parameters

| Name                            | Description                                                                                                      | Value                 |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------- | --------------------- |
| `image.registry`                | HashiCorp Consul image registry                                                                                  | `docker.io`           |
| `image.repository`              | HashiCorp Consul image repository                                                                                | `bitnami/consul`      |
| `image.tag`                     | HashiCorp Consul image tag (immutable tags are recommended)                                                      | `1.15.3-debian-11-r0` |
| `image.digest`                  | HashiCorp Consul image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `image.pullPolicy`              | HashiCorp Consul image pull policy                                                                               | `IfNotPresent`        |
| `image.pullSecrets`             | HashiCorp Consul image pull secrets                                                                              | `[]`                  |
| `image.debug`                   | Enable image debug mode                                                                                          | `false`               |
| `datacenterName`                | Datacenter name for Consul. If not supplied, will use the Consul                                                 | `dc1`                 |
| `domain`                        | Consul domain name                                                                                               | `consul`              |
| `raftMultiplier`                | Multiplier used to scale key Raft timing parameters                                                              | `1`                   |
| `gossipKey`                     | Gossip key for all members. The key must be 16-bytes, can be generated with $(consul keygen)                     | `""`                  |
| `tlsEncryptionSecretName`       | Name of existing secret with TLS encryption data                                                                 | `""`                  |
| `hostAliases`                   | Deployment pod host aliases                                                                                      | `[]`                  |
| `configuration`                 | HashiCorp Consul configuration to be injected as ConfigMap                                                       | `""`                  |
| `existingConfigmap`             | ConfigMap with HashiCorp Consul configuration                                                                    | `""`                  |
| `localConfig`                   | Extra configuration that will be added to the default one                                                        | `""`                  |
| `podLabels`                     | Pod labels                                                                                                       | `{}`                  |
| `priorityClassName`             | Priority class assigned to the Pods                                                                              | `""`                  |
| `runtimeClassName`              | Name of the runtime class to be used by pod(s)                                                                   | `""`                  |
| `schedulerName`                 | Alternative scheduler                                                                                            | `""`                  |
| `terminationGracePeriodSeconds` | In seconds, time the given to the Consul pod needs to terminate gracefully                                       | `""`                  |
| `topologySpreadConstraints`     | Topology Spread Constraints for pod assignment                                                                   | `[]`                  |
| `command`                       | Command for running the container (set to default if not set). Use array form                                    | `[]`                  |
| `args`                          | Args for running the container (set to default if not set). Use array form                                       | `[]`                  |
| `extraEnvVars`                  | Extra environment variables to be set on HashiCorp Consul container                                              | `[]`                  |
| `extraEnvVarsCM`                | Name of existing ConfigMap containing extra env vars                                                             | `""`                  |
| `extraEnvVarsSecret`            | Name of existing Secret containing extra env vars                                                                | `""`                  |
| `containerPorts.http`           | Port to open for HTTP in Consul                                                                                  | `8500`                |
| `containerPorts.dns`            | Port to open for DNS server in Consul                                                                            | `8600`                |
| `containerPorts.rpc`            | Port to open for RPC in Consul                                                                                   | `8400`                |
| `containerPorts.rpcServer`      | Port to open for RPC Server in Consul                                                                            | `8300`                |
| `containerPorts.serfLAN`        | Port to open for Serf LAN in Consul                                                                              | `8301`                |
| `lifecycleHooks`                | Add lifecycle hooks to the deployment                                                                            | `{}`                  |

### Statefulset parameters

| Name                                                | Description                                                                               | Value           |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------- | --------------- |
| `replicaCount`                                      | Number of HashiCorp Consul replicas to deploy                                             | `3`             |
| `updateStrategy.type`                               | Update strategy type for the HashiCorp Consul statefulset                                 | `RollingUpdate` |
| `podManagementPolicy`                               | StatefulSet pod management policy                                                         | `Parallel`      |
| `podAnnotations`                                    | Additional pod annotations                                                                | `{}`            |
| `podAffinityPreset`                                 | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `nodeAffinityPreset.key`                            | Node label key to match. Ignored if `affinity` is set.                                    | `""`            |
| `nodeAffinityPreset.values`                         | Node label values to match. Ignored if `affinity` is set.                                 | `[]`            |
| `affinity`                                          | Affinity for pod assignment                                                               | `{}`            |
| `nodeSelector`                                      | Node labels for pod assignment                                                            | `{}`            |
| `tolerations`                                       | Tolerations for pod assignment                                                            | `[]`            |
| `podSecurityContext.enabled`                        | Enable security context for HashiCorp Consul pods                                         | `true`          |
| `podSecurityContext.fsGroup`                        | Group ID for the volumes of the pod                                                       | `1001`          |
| `containerSecurityContext.enabled`                  | HashiCorp Consul Container securityContext                                                | `true`          |
| `containerSecurityContext.runAsUser`                | User ID for the HashiCorp Consul container                                                | `1001`          |
| `containerSecurityContext.runAsNonRoot`             | Force the container to be run as non root                                                 | `true`          |
| `containerSecurityContext.allowPrivilegeEscalation` | Force the child process to be run as nonprivilege                                         | `false`         |
| `resources.limits`                                  | The resources limits for HashiCorp Consul containers                                      | `{}`            |
| `resources.requests`                                | The requested resources for HashiCorp Consul containers                                   | `{}`            |
| `livenessProbe.enabled`                             | Enable livenessProbe                                                                      | `true`          |
| `livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                   | `30`            |
| `livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                          | `10`            |
| `livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                         | `5`             |
| `livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                       | `6`             |
| `livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                       | `1`             |
| `readinessProbe.enabled`                            | Enable readinessProbe                                                                     | `true`          |
| `readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                  | `5`             |
| `readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                         | `10`            |
| `readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                        | `5`             |
| `readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                      | `6`             |
| `readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                      | `1`             |
| `startupProbe.enabled`                              | Enable startupProbe                                                                       | `false`         |
| `startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                    | `0`             |
| `startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                           | `10`            |
| `startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                          | `5`             |
| `startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                        | `60`            |
| `startupProbe.successThreshold`                     | Success threshold for startupProbe                                                        | `1`             |
| `customLivenessProbe`                               | Override default liveness probe                                                           | `{}`            |
| `customReadinessProbe`                              | Override default readiness probe                                                          | `{}`            |
| `customStartupProbe`                                | Override default startup probe                                                            | `{}`            |
| `extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for Hashicorp Consul container   | `[]`            |
| `extraVolumes`                                      | Optionally specify extra list of additional volumes for Hashicorp Consul container        | `[]`            |
| `initContainers`                                    | Add additional init containers to the Hashicorp Consul pods                               | `[]`            |
| `sidecars`                                          | Add additional sidecar containers to the Hashicorp Consul pods                            | `[]`            |
| `pdb.create`                                        | Enable/disable a Pod Disruption Budget creation                                           | `false`         |
| `pdb.minAvailable`                                  | Minimum number of pods that must still be available after the eviction                    | `1`             |
| `pdb.maxUnavailable`                                | Max number of pods that can be unavailable after the eviction                             | `""`            |

### Exposure parameters

| Name                               | Description                                                                                                                      | Value                    |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.enabled`                  | Use a service to access HashiCorp Consul Ui                                                                                      | `true`                   |
| `service.ports.http`               | HashiCorp Consul UI svc port                                                                                                     | `80`                     |
| `service.type`                     | HashiCorp Consul UI Service Type                                                                                                 | `ClusterIP`              |
| `service.nodePorts.http`           | Node port for HashiCorp Consul UI                                                                                                | `""`                     |
| `service.clusterIP`                | Consul service Cluster IP                                                                                                        | `""`                     |
| `service.loadBalancerIP`           | HashiCorp Consul UI service Load Balancer IP                                                                                     | `""`                     |
| `service.loadBalancerSourceRanges` | Consul service Load Balancer sources                                                                                             | `[]`                     |
| `service.annotations`              | Annotations for HashiCorp Consul UI service                                                                                      | `{}`                     |
| `service.externalTrafficPolicy`    | Service external traffic policy                                                                                                  | `Cluster`                |
| `service.extraPorts`               | Extra ports to expose (normally used with the `sidecar` value)                                                                   | `[]`                     |
| `service.sessionAffinity`          | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                             | `None`                   |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `service.headless.annotations`     | Annotations for the headless service.                                                                                            | `{}`                     |
| `ingress.enabled`                  | Enable ingress resource for Management console                                                                                   | `false`                  |
| `ingress.path`                     | Path for the default host                                                                                                        | `/`                      |
| `ingress.apiVersion`               | Override API Version (automatically detected if not set)                                                                         | `""`                     |
| `ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.hostname`                 | Default host for the ingress resource, a host pointing to this will be created                                                   | `consul-ui.local`        |
| `ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.ingressClassName`         | Set the ingerssClassName on the ingress record for k8s 1.18+                                                                     | `""`                     |
| `ingress.tls`                      | Enable TLS configuration for the hostname defined at ingress.hostname parameter                                                  | `false`                  |
| `ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `ingress.extraPaths`               | Any additional arbitrary paths that may need to be added to the ingress under the main host.                                     | `[]`                     |
| `ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `ingress.secrets`                  | If you're providing your own certificates, please use this to add the certificates as secrets                                    | `[]`                     |
| `ingress.existingSecret`           | It is you own the certificate as secret.                                                                                         | `""`                     |
| `ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### Persistence parameters

| Name                       | Description                                                                                               | Value               |
| -------------------------- | --------------------------------------------------------------------------------------------------------- | ------------------- |
| `persistence.enabled`      | Enable HashiCorp Consul data persistence using PVC, use a Persistent Volume Claim, If false, use emptyDir | `true`              |
| `persistence.storageClass` | Persistent Volume storage class                                                                           | `""`                |
| `persistence.annotations`  | Persistent Volume Claim annotations                                                                       | `{}`                |
| `persistence.accessModes`  | Persistent Volume Access Mode                                                                             | `["ReadWriteOnce"]` |
| `persistence.size`         | PVC Storage Request for HashiCorp Consul data volume                                                      | `8Gi`               |

### Volume Permissions parameters

| Name                                   | Description                                                                                                   | Value                   |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`            | Enable init container that changes the owner and group of the persistent volume                               | `false`                 |
| `volumePermissions.image.registry`     | Bitnami Shell image registry                                                                                  | `docker.io`             |
| `volumePermissions.image.repository`   | Bitnami Shell image repository                                                                                | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`          | Bitnami Shell image tag (immutable tags are recommended)                                                      | `11-debian-11-r121`     |
| `volumePermissions.image.digest`       | Bitnami Shell image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `volumePermissions.image.pullPolicy`   | Bitnami Shell image pull policy                                                                               | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`  | Bitnami Shell image pull secrets                                                                              | `[]`                    |
| `volumePermissions.resources.limits`   | The resources limits for the container                                                                        | `{}`                    |
| `volumePermissions.resources.requests` | The requested resources for the container                                                                     | `{}`                    |

### Metrics parameters

| Name                                            | Description                                                                                                                          | Value                     |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------- |
| `metrics.enabled`                               | Start a side-car prometheus exporter                                                                                                 | `false`                   |
| `metrics.image.registry`                        | HashiCorp Consul Prometheus Exporter image registry                                                                                  | `docker.io`               |
| `metrics.image.repository`                      | HashiCorp Consul Prometheus Exporter image repository                                                                                | `bitnami/consul-exporter` |
| `metrics.image.tag`                             | HashiCorp Consul Prometheus Exporter image tag (immutable tags are recommended)                                                      | `0.9.0-debian-11-r60`     |
| `metrics.image.digest`                          | HashiCorp Consul Prometheus Exporter image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                      |
| `metrics.image.pullPolicy`                      | HashiCorp Consul Prometheus Exporter image pull policy                                                                               | `IfNotPresent`            |
| `metrics.image.pullSecrets`                     | HashiCorp Consul Prometheus Exporter image pull secrets                                                                              | `[]`                      |
| `metrics.containerSecurityContext.enabled`      | HashiCorp Consul Prometheus Exporter securityContext                                                                                 | `true`                    |
| `metrics.containerSecurityContext.runAsUser`    | User ID for the HashiCorp Consul Prometheus Exporter                                                                                 | `1001`                    |
| `metrics.containerSecurityContext.runAsNonRoot` | Force the container to be run as non root                                                                                            | `true`                    |
| `metrics.service.type`                          | Kubernetes Service type                                                                                                              | `ClusterIP`               |
| `metrics.service.loadBalancerIP`                | Service Load Balancer IP                                                                                                             | `""`                      |
| `metrics.service.annotations`                   | Provide any additional annotations which may be required.                                                                            | `{}`                      |
| `metrics.podAnnotations`                        | Metrics exporter pod Annotation and Labels                                                                                           | `{}`                      |
| `metrics.resources.limits`                      | The resources limits for the container                                                                                               | `{}`                      |
| `metrics.resources.requests`                    | The requested resources for the container                                                                                            | `{}`                      |
| `metrics.serviceMonitor.enabled`                | Create ServiceMonitor Resource for scraping metrics using PrometheusOperator, set to true to create a Service Monitor Entry          | `false`                   |
| `metrics.serviceMonitor.namespace`              | The namespace in which the ServiceMonitor will be created                                                                            | `""`                      |
| `metrics.serviceMonitor.interval`               | Interval at which metrics should be scraped                                                                                          | `30s`                     |
| `metrics.serviceMonitor.scrapeTimeout`          | The timeout after which the scrape is ended                                                                                          | `""`                      |
| `metrics.serviceMonitor.metricRelabelings`      | Metrics relabelings to add to the scrape endpoint                                                                                    | `[]`                      |
| `metrics.serviceMonitor.relabelings`            | RelabelConfigs to apply to samples before scraping                                                                                   | `[]`                      |
| `metrics.serviceMonitor.honorLabels`            | Specify honorLabels parameter to add the scrape endpoint                                                                             | `false`                   |
| `metrics.serviceMonitor.jobLabel`               | The name of the label on the target service to use as the job name in prometheus.                                                    | `""`                      |
| `metrics.serviceMonitor.selector`               | ServiceMonitor selector labels                                                                                                       | `{}`                      |
| `metrics.serviceMonitor.labels`                 | Used to pass Labels that are used by the Prometheus installed in your cluster to select Service Monitors to work with                | `{}`                      |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release --set domain=consul-domain,gossipKey=secretkey oci://registry-1.docker.io/bitnamicharts/consul
```

The above command sets the HashiCorp Consul domain to `consul-domain` and sets the gossip key to `secretkey`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/consul
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Using custom configuration

This helm chart supports to customize the whole configuration file.

You can specify the Hashicorp Consul configuration using the `configuration` parameter.

In addition to this option, you can also set an external ConfigMap with all the configuration files. This is done by setting the `existingConfigmap` parameter. Note that this will override the previous option.

### Ingress

This chart provides support for ingress resources. If you have an ingress controller installed on your cluster, such as nginx-ingress or traefik you can utilize the ingress controller to serve your ASP.NET Core application.

To enable ingress integration, please set `ingress.enabled` to `true`.

#### Hosts

Most likely you will only want to have one hostname that maps to this ASP.NET Core installation. If that's your case, the property `ingress.hostname` will set it. However, it is possible to have more than one host. To facilitate this, the `ingress.extraHosts` object can be specified as an array. You can also use `ingress.extraTLS` to add the TLS configuration for extra hosts.

For each host indicated at `ingress.extraHosts`, please indicate a `name`, `path`, and any `annotations` that you may want the ingress controller to know about.

For annotations, please see [this document](https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/nginx-configuration/annotations.md). Not all annotations are supported by all ingress controllers, but this document does a good job of indicating which annotation is supported by many popular ingress controllers.

### TLS Secrets

This chart will facilitate the creation of TLS secrets for use with the ingress controller, however, this is not required.  There are three common use cases:

- Helm generates/manages certificate secrets
- User generates/manages certificates separately
- An additional tool (like cert-manager) manages the secrets for the application

In the first two cases, one will need a certificate and a key.  We would expect them to look like this:

- certificate files should look like (and there can be more than one certificate if there is a certificate chain)

```console
-----BEGIN CERTIFICATE-----
MIID6TCCAtGgAwIBAgIJAIaCwivkeB5EMA0GCSqGSIb3DQEBCwUAMFYxCzAJBgNV
...
jScrvkiBO65F46KioCL9h5tDvomdU1aqpI/CBzhvZn1c0ZTf87tGQR8NK7v7
-----END CERTIFICATE-----
```

- keys should look like:

```console
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvLYcyu8f3skuRyUgeeNpeDvYBCDcgq+LsWap6zbX5f8oLqp4
...
wrj2wDbCDCFmfqnSJ+dKI3vFLlEz44sAV8jX/kd4Y6ZTQhlLbYc=
-----END RSA PRIVATE KEY-----
```

If you are going to use Helm to manage the certificates, please copy these values into the `certificate` and `key` values for a given `ingress.secrets` entry.

If you are going to manage TLS secrets outside of Helm, please know that you can create a TLS secret (named `consul-ui.local-tls` for example).

Please see [this example](https://github.com/kubernetes/contrib/tree/master/ingress/controllers/nginx/examples/tls) for more information.

#### Enable TLS encryption between servers

You must manually create a secret containing your PEM-encoded certificate authority, your PEM-encoded certificate, and your PEM-encoded private key.

> Take into account that you will need to create a config map with the proper configuration.

If the secret is specified, the chart will locate those files at `/opt/bitnami/consul/certs/`, so you will want to use the below snippet to configure HashiCorp Consul TLS encryption in your config map:

```json
  "ca_file": "/opt/bitnami/consul/certs/ca.pem",
  "cert_file": "/opt/bitnami/consul/certs/consul.pem",
  "key_file": "/opt/bitnami/consul/certs/consul-key.pem",
  "verify_incoming": true,
  "verify_outgoing": true,
  "verify_server_hostname": true,
```

After creating the secret, you can install the helm chart specyfing the secret name using `tlsEncryptionSecretName=consul-tls-encryption`.

### Metrics

The chart can optionally start a metrics exporter endpoint on port `9107` for [prometheus](https://prometheus.io). The data exposed by the endpoint is intended to be consumed by a prometheus chart deployed within the cluster and as such the endpoint is not exposed outside the cluster.

### Adding extra environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property.

```yaml
extraEnvVars:
  - name: LOG_LEVEL
    value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `.extraEnvVarsCM` or the `extraEnvVarsSecret` properties.

### Setting Pod's affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod's affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, you can use of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

### Sidecars and Init Containers

If you have a need for additional containers to run within the same pod as MongoDB&reg;, you can do so via the `sidecars` config parameter. Simply define your container according to the Kubernetes container spec.

```yaml
sidecars:
  - name: your-image-name
    image: your-image
    imagePullPolicy: Always
    ports:
      - name: portname
       containerPort: 1234
```

Similarly, you can add extra init containers using the `initContainers` parameter.

```yaml
initContainers:
  - name: your-image-name
    image: your-image
    imagePullPolicy: Always
    ports:
      - name: portname
        containerPort: 1234
```

## Persistence

The [Bitnami HashiCorp Consul](https://github.com/bitnami/containers/tree/main/bitnami/consul) image stores the HashiCorp Consul data at the `/bitnami` path of the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Parameters](#parameters) section to configure the PVC or to disable persistence.

### Adjust permissions of persistent volume mountpoint

As the image run as non-root by default, it is necessary to adjust the ownership of the persistent volume so that the container can write data into it.

By default, the chart is configured to use Kubernetes Security Context to automatically change the ownership of the volume. However this feature does not work in all Kubernetes distributions.
As an alternative, this chart supports using an initContainer to change the ownership of the volume before mounting it in the final destination.

You can enable this initContainer by setting `volumePermissions.enabled` to `true`.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 10.0.0

This major release renames several values in this chart and adds missing features, in order to be inline with the rest of assets in the Bitnami charts repository.

Affected values:

- `service.port` renamed as `service.port.http`.
- `service.nodePort` renamed as `service.nodePorts.http`.
- `updateStrategy` changed from String type (previously default to 'rollingUpdate') to Object type, allowing users to configure other updateStrategy parameters, similar to other charts.

### To 9.0.0

[On November 13, 2020, Helm v2 support was formally finished](https://github.com/helm/charts#status-of-the-project), this major version is the result of the required changes applied to the Helm Chart to be able to incorporate the different features added in Helm v3 and to be consistent with the Helm project itself regarding the Helm v2 EOL.

#### What changes were introduced in this major version?

- Previous versions of this Helm Chart use `apiVersion: v1` (installable by both Helm 2 and 3), this Helm Chart was updated to `apiVersion: v2` (installable by Helm 3 only). [Here](https://helm.sh/docs/topics/charts/#the-apiversion-field) you can find more information about the `apiVersion` field.
- Move dependency information from the *requirements.yaml* to the *Chart.yaml*
- After running `helm dependency update`, a *Chart.lock* file is generated containing the same structure used in the previous *requirements.lock*
- The different fields present in the *Chart.yaml* file has been ordered alphabetically in a homogeneous way for all the Bitnami Helm Charts

#### Considerations when upgrading to this version

- If you want to upgrade to this version from a previous one installed with Helm v3, you shouldn't face any issues
- If you want to upgrade to this version using Helm v2, this scenario is not supported as this version doesn't support Helm v2 anymore
- If you installed the previous version with Helm v2 and wants to upgrade to this version with Helm v3, please refer to the [official Helm documentation](https://helm.sh/docs/topics/v2_v3_migration/#migration-use-cases) about migrating from Helm v2 to v3

#### Useful links

- <https://docs.bitnami.com/tutorials/resolve-helm2-helm3-post-migration-issues/>
- <https://helm.sh/docs/topics/v2_v3_migration/>
- <https://helm.sh/blog/migrate-from-helm-v2-to-helm-v3/>

### To 8.0.0

- Several parameters were renamed or disappeared in favor of new ones on this major version:
  - `securityContext.*` is deprecated in favor of `podSecurityContext` and `containerSecurityContext`.
  - `replicas` is renamed to `replicaCount`.
  - `updateStrategy.type` is renamed to `updateStrategy`.
  - `configmap` is renamed to `configuration`.
- Chart labels were adapted to follow the [Helm charts standard labels](https://helm.sh/docs/chart_best_practices/labels/#standard-labels).
- This version also introduces `bitnami/common`, a [library chart](https://helm.sh/docs/topics/library_charts/#helm) as a dependency. More documentation about this new utility could be found [here](https://github.com/bitnami/charts/tree/main/bitnami/common#bitnami-common-library-chart). Please, make sure that you have updated the chart dependencies before executing any upgrade.

### To 7.0.0

Consul pods are now deployed in parallel in order to bootstrap the cluster and be discovered.

The field `podManagementPolicy` can't be updated in a StatefulSet, so you need to destroy it before you upgrade the chart to this version.

```console
kubectl delete statefulset consul
helm upgrade <DEPLOYMENT_NAME> oci://registry-1.docker.io/bitnamicharts/consul
```

### To 6.0.0

This release updates the Bitnami Consul container to `1.6.1-debian-9-r6`, which is based on Bash instead of Node.js.

### To 3.1.0

Consul container was moved to a non-root approach. There shouldn't be any issue when upgrading since the corresponding `securityContext` is enabled by default. Both the container image and the chart can be upgraded by running the command below:

```console
helm upgrade my-release oci://registry-1.docker.io/bitnamicharts/consul
```

If you use a previous container image (previous to **1.4.0-r16**) disable the `securityContext` by running the command below:

```console
helm upgrade my-release oci://registry-1.docker.io/bitnamicharts/consul --set securityContext.enabled=false,image.tag=XXX
```

### To 2.0.0

Backwards compatibility is not guaranteed unless you modify the labels used on the chart's deployments.
Use the workaround below to upgrade from versions previous to 2.0.0. The following example assumes that the release name is consul:

```console
kubectl delete statefulset consul --cascade=false
```

## License

Copyright &copy; 2023 VMware, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.