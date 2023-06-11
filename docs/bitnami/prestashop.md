<!--- app-name: PrestaShop -->

# PrestaShop packaged by Bitnami

PrestaShop is a powerful open source eCommerce platform used by over 250,000 online storefronts worldwide. It is easily customizable, responsive, and includes powerful tools to drive online sales.

[Overview of PrestaShop](http://www.prestashop.com)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/prestashop
```

## Introduction

This chart bootstraps a [PrestaShop](https://github.com/bitnami/containers/tree/main/bitnami/prestashop) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages the [Bitnami MariaDB chart](https://github.com/bitnami/charts/tree/main/bitnami/mariadb) which is required for bootstrapping a MariaDB deployment for the database requirements of the PrestaShop application.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/prestashop
```

The command deploys PrestaShop on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Common parameters

| Name                | Description                                                                                                    | Value |
| ------------------- | -------------------------------------------------------------------------------------------------------------- | ----- |
| `kubeVersion`       | Force target Kubernetes version (using Helm capabilities if not set)                                           | `""`  |
| `nameOverride`      | String to partially override prestashop.fullname template (will maintain the release name)                     | `""`  |
| `fullnameOverride`  | String to fully override prestashop.fullname template                                                          | `""`  |
| `namespaceOverride` | String to fully override common.names.namespace                                                                | `""`  |
| `commonAnnotations` | Common annotations to add to all PrestaShop resources (sub-charts are not considered). Evaluated as a template | `{}`  |
| `commonLabels`      | Common labels to add to all PrestaShop resources (sub-charts are not considered). Evaluated as a template      | `{}`  |
| `extraDeploy`       | Array with extra yaml to deploy with the chart. Evaluated as a template                                        | `[]`  |

### PrestaShop parameters

| Name                                    | Description                                                                                                | Value                |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------- | -------------------- |
| `image.registry`                        | PrestaShop image registry                                                                                  | `docker.io`          |
| `image.repository`                      | PrestaShop image repository                                                                                | `bitnami/prestashop` |
| `image.tag`                             | PrestaShop image tag (immutable tags are recommended)                                                      | `8.0.4-debian-11-r9` |
| `image.digest`                          | PrestaShop image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                 |
| `image.pullPolicy`                      | PrestaShop image pull policy                                                                               | `IfNotPresent`       |
| `image.pullSecrets`                     | Specify docker-registry secret names as an array                                                           | `[]`                 |
| `image.debug`                           | Specify if debug logs should be enabled                                                                    | `false`              |
| `hostAliases`                           | Deployment pod host aliases                                                                                | `[]`                 |
| `replicaCount`                          | Number of PrestaShop Pods to run (requires ReadWriteMany PVC support)                                      | `1`                  |
| `prestashopSkipInstall`                 | Skip PrestaShop installation wizard. Useful for migrations and restoring from SQL dump                     | `false`              |
| `prestashopHost`                        | PrestaShop host to create application URLs (when ingress, it will be ignored)                              | `""`                 |
| `prestashopUsername`                    | User of the application                                                                                    | `user@example.com`   |
| `prestashopPassword`                    | Application password                                                                                       | `""`                 |
| `prestashopEmail`                       | Admin email                                                                                                | `user@example.com`   |
| `prestashopFirstName`                   | First Name                                                                                                 | `Bitnami`            |
| `prestashopLastName`                    | Last Name                                                                                                  | `User`               |
| `prestashopCookieCheckIP`               | Whether to check the cookie's IP address or not                                                            | `no`                 |
| `prestashopCountry`                     | Default country of the store                                                                               | `us`                 |
| `prestashopLanguage`                    | Default language of the store (ISO code)                                                                   | `en`                 |
| `allowEmptyPassword`                    | Allow DB blank passwords                                                                                   | `true`               |
| `command`                               | Override default container command (useful when using custom images)                                       | `[]`                 |
| `args`                                  | Override default container args (useful when using custom images)                                          | `[]`                 |
| `updateStrategy.type`                   | Update strategy - only really applicable for deployments with RWO PVs attached                             | `RollingUpdate`      |
| `extraEnvVars`                          | An array to add extra environment variables                                                                | `[]`                 |
| `extraEnvVarsCM`                        | ConfigMap with extra environment variables                                                                 | `""`                 |
| `extraEnvVarsSecret`                    | Secret with extra environment variables                                                                    | `""`                 |
| `extraVolumes`                          | Extra volumes to add to the deployment. Requires setting `extraVolumeMounts`                               | `[]`                 |
| `extraVolumeMounts`                     | Extra volume mounts to add to the container. Normally used with `extraVolumes`                             | `[]`                 |
| `initContainers`                        | Extra init containers to add to the deployment                                                             | `[]`                 |
| `sidecars`                              | Extra sidecar containers to add to the deployment                                                          | `[]`                 |
| `tolerations`                           | Tolerations for pod assignment. Evaluated as a template.                                                   | `[]`                 |
| `priorityClassName`                     | PrestaShop pods' priorityClassName                                                                         | `""`                 |
| `schedulerName`                         | Name of the k8s scheduler (other than default)                                                             | `""`                 |
| `topologySpreadConstraints`             | Topology Spread Constraints for pod assignment                                                             | `[]`                 |
| `existingSecret`                        | Use existing secret for the application password                                                           | `""`                 |
| `smtpHost`                              | SMTP host                                                                                                  | `""`                 |
| `smtpPort`                              | SMTP port                                                                                                  | `""`                 |
| `smtpUser`                              | SMTP user                                                                                                  | `""`                 |
| `smtpPassword`                          | SMTP password                                                                                              | `""`                 |
| `smtpProtocol`                          | SMTP Protocol (options: ssl,tls, nil)                                                                      | `""`                 |
| `containerPorts.http`                   | Sets HTTP port inside NGINX container                                                                      | `8080`               |
| `containerPorts.https`                  | Sets HTTPS port inside NGINX container                                                                     | `8443`               |
| `sessionAffinity`                       | Control where client requests go, to the same pod or round-robin                                           | `None`               |
| `persistence.enabled`                   | Enable persistence using PVC                                                                               | `true`               |
| `persistence.storageClass`              | PrestaShop Data Persistent Volume Storage Class                                                            | `""`                 |
| `persistence.accessModes`               | PVC Access Mode for PrestaShop volume                                                                      | `["ReadWriteOnce"]`  |
| `persistence.size`                      | PVC Storage Request for PrestaShop volume                                                                  | `8Gi`                |
| `persistence.existingClaim`             | An Existing PVC name                                                                                       | `""`                 |
| `persistence.hostPath`                  | If defined, the prestashop-data volume will mount to the specified hostPath                                | `""`                 |
| `persistence.annotations`               | Persistent Volume Claim annotations                                                                        | `{}`                 |
| `podAffinityPreset`                     | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                        | `""`                 |
| `podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                   | `soft`               |
| `nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                  | `""`                 |
| `nodeAffinityPreset.key`                | Node label key to match Ignored if `affinity` is set.                                                      | `""`                 |
| `nodeAffinityPreset.values`             | Node label values to match. Ignored if `affinity` is set.                                                  | `[]`                 |
| `affinity`                              | Affinity for pod assignment                                                                                | `{}`                 |
| `nodeSelector`                          | Node labels for pod assignment. Evaluated as a template.                                                   | `{}`                 |
| `resources.requests`                    | The requested resources for the container                                                                  | `{}`                 |
| `resources.limits`                      | The resources limits for the container                                                                     | `{}`                 |
| `podSecurityContext.enabled`            | Enable PrestaShop pods' Security Context                                                                   | `true`               |
| `podSecurityContext.fsGroup`            | PrestaShop pods' group ID                                                                                  | `1001`               |
| `containerSecurityContext.enabled`      | Enable PrestaShop containers' Security Context                                                             | `true`               |
| `containerSecurityContext.runAsUser`    | PrestaShop containers' Security Context runAsUser                                                          | `1001`               |
| `containerSecurityContext.runAsNonRoot` | PrestaShop containers' Security Context runAsNonRoot                                                       | `true`               |
| `livenessProbe.enabled`                 | Enable livenessProbe                                                                                       | `true`               |
| `livenessProbe.path`                    | Request path for livenessProbe                                                                             | `/`                  |
| `livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                    | `600`                |
| `livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                           | `10`                 |
| `livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                          | `5`                  |
| `livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                        | `6`                  |
| `livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                        | `1`                  |
| `readinessProbe.enabled`                | Enable readinessProbe                                                                                      | `true`               |
| `readinessProbe.path`                   | Request path for readinessProbe                                                                            | `/`                  |
| `readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                   | `30`                 |
| `readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                          | `5`                  |
| `readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                         | `3`                  |
| `readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                       | `6`                  |
| `readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                       | `1`                  |
| `startupProbe.enabled`                  | Enable startupProbe                                                                                        | `false`              |
| `startupProbe.path`                     | Request path for startupProbe                                                                              | `/`                  |
| `startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                     | `0`                  |
| `startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                            | `10`                 |
| `startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                           | `3`                  |
| `startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                         | `60`                 |
| `startupProbe.successThreshold`         | Success threshold for startupProbe                                                                         | `1`                  |
| `customLivenessProbe`                   | Override default liveness probe                                                                            | `{}`                 |
| `customReadinessProbe`                  | Override default readiness probe                                                                           | `{}`                 |
| `customStartupProbe`                    | Override default startup probe                                                                             | `{}`                 |
| `lifecycleHooks`                        | LifecycleHook to set additional configuration at startup Evaluated as a template                           | `{}`                 |
| `podAnnotations`                        | Pod annotations                                                                                            | `{}`                 |
| `podLabels`                             | Pod extra labels                                                                                           | `{}`                 |

### Traffic Exposure Parameters

| Name                               | Description                                                                                                                      | Value                    |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.type`                     | Kubernetes Service type                                                                                                          | `LoadBalancer`           |
| `service.ports.http`               | Service HTTP port                                                                                                                | `80`                     |
| `service.ports.https`              | Service HTTPS port                                                                                                               | `443`                    |
| `service.clusterIP`                | Service Cluster IP                                                                                                               | `""`                     |
| `service.loadBalancerSourceRanges` | Control hosts connecting to "LoadBalancer" only                                                                                  | `[]`                     |
| `service.loadBalancerIP`           | Load balancerIP for the PrestaShop Service (optional, cloud specific)                                                            | `""`                     |
| `service.nodePorts.http`           | Kubernetes HTTP node port                                                                                                        | `""`                     |
| `service.nodePorts.https`          | Kubernetes HTTPS node port                                                                                                       | `""`                     |
| `service.externalTrafficPolicy`    | Enable client source IP preservation                                                                                             | `Cluster`                |
| `service.extraPorts`               | Extra ports to expose (normally used with the `sidecar` value)                                                                   | `[]`                     |
| `service.annotations`              | Additional custom annotations for PrestaShop service                                                                             | `{}`                     |
| `service.sessionAffinity`          | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                             | `None`                   |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `ingress.enabled`                  | Enable ingress controller resource                                                                                               | `false`                  |
| `ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.apiVersion`               | Override API Version (automatically detected if not set)                                                                         | `""`                     |
| `ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `ingress.hostname`                 | Default host for the ingress resource                                                                                            | `prestashop.local`       |
| `ingress.path`                     | Default path for the ingress resource*' in order to use this                                                                     | `/`                      |
| `ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.tls`                      | Create TLS Secret                                                                                                                | `false`                  |
| `ingress.extraHosts`               | The list of additional hostnames to be covered with this ingress record.                                                         | `[]`                     |
| `ingress.extraPaths`               | Any additional arbitrary paths that may need to be added to the ingress under the main host.                                     | `[]`                     |
| `ingress.extraTls`                 | The tls configuration for additional hostnames to be covered with this ingress record.                                           | `[]`                     |
| `ingress.secrets`                  | If you're providing your own certificates, please use this to add the certificates as secrets                                    | `[]`                     |
| `ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### Database parameters

| Name                                        | Description                                                                              | Value                |
| ------------------------------------------- | ---------------------------------------------------------------------------------------- | -------------------- |
| `mariadb.enabled`                           | Whether to deploy a mariadb server to satisfy the applications database requirements     | `true`               |
| `mariadb.architecture`                      | MariaDB architecture. Allowed values: `standalone` or `replication`                      | `standalone`         |
| `mariadb.auth.rootPassword`                 | Password for the MariaDB `root` user                                                     | `""`                 |
| `mariadb.auth.database`                     | Database name to create                                                                  | `bitnami_prestashop` |
| `mariadb.auth.username`                     | Database user to create                                                                  | `bn_prestashop`      |
| `mariadb.auth.password`                     | Password for the database                                                                | `""`                 |
| `mariadb.primary.persistence.enabled`       | Enable database persistence using PVC                                                    | `true`               |
| `mariadb.primary.persistence.storageClass`  | MariaDB primary persistent volume storage Class                                          | `""`                 |
| `mariadb.primary.persistence.accessModes`   | Database Persistent Volume Access Modes                                                  | `["ReadWriteOnce"]`  |
| `mariadb.primary.persistence.size`          | Database Persistent Volume Size                                                          | `8Gi`                |
| `mariadb.primary.persistence.hostPath`      | Set path in case you want to use local host path volumes (not recommended in production) | `""`                 |
| `mariadb.primary.persistence.existingClaim` | Name of an existing `PersistentVolumeClaim` for MariaDB primary replicas                 | `""`                 |
| `externalDatabase.host`                     | Host of the existing database                                                            | `""`                 |
| `externalDatabase.port`                     | Port of the existing database                                                            | `3306`               |
| `externalDatabase.user`                     | Existing username in the existing database                                               | `bn_prestashop`      |
| `externalDatabase.password`                 | Password for the above username                                                          | `""`                 |
| `externalDatabase.database`                 | Name of the existing database                                                            | `bitnami_prestashop` |
| `externalDatabase.existingSecret`           | Name of an existing secret resource containing the DB password                           | `""`                 |

### Volume Permissions parameters

| Name                                   | Description                                                                                                                                               | Value                   |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`            | Enable init container that changes volume permissions in the data directory (for cases where the default k8s `runAsUser` and `fsUser` values do not work) | `false`                 |
| `volumePermissions.image.registry`     | Init container volume-permissions image registry                                                                                                          | `docker.io`             |
| `volumePermissions.image.repository`   | Init container volume-permissions image repository                                                                                                        | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`          | Init container volume-permissions image tag (immutable tags are recommended)                                                                              | `11-debian-11-r118`     |
| `volumePermissions.image.digest`       | Init container volume-permissions image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                         | `""`                    |
| `volumePermissions.image.pullPolicy`   | Init container volume-permissions image pull policy                                                                                                       | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`  | Specify docker-registry secret names as an array                                                                                                          | `[]`                    |
| `volumePermissions.resources.limits`   | The resources limits for the container                                                                                                                    | `{}`                    |
| `volumePermissions.resources.requests` | The requested resources for the container                                                                                                                 | `{}`                    |

### Metrics parameters

| Name                         | Description                                                                                                     | Value                     |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `metrics.enabled`            | Start a side-car prometheus exporter                                                                            | `false`                   |
| `metrics.image.registry`     | Apache exporter image registry                                                                                  | `docker.io`               |
| `metrics.image.repository`   | Apache exporter image repository                                                                                | `bitnami/apache-exporter` |
| `metrics.image.tag`          | Apache exporter image tag (immutable tags are recommended)                                                      | `0.13.3-debian-11-r9`     |
| `metrics.image.digest`       | Apache exporter image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                      |
| `metrics.image.pullPolicy`   | Apache exporter image pull policy                                                                               | `IfNotPresent`            |
| `metrics.image.pullSecrets`  | Specify docker-registry secret names as an array                                                                | `[]`                      |
| `metrics.resources.requests` | The requested resources for the metrics exporter container                                                      | `{}`                      |
| `metrics.resources.limits`   | The resources limits for the container for the metrics exporter container                                       | `{}`                      |
| `metrics.podAnnotations`     | Metrics exporter pod annotations                                                                                | `{}`                      |

### Certificate injection parameters

| Name                                                 | Description                                                                                                       | Value                                    |
| ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ---------------------------------------- |
| `certificates.customCertificate.certificateSecret`   | Secret containing the certificate and key to add                                                                  | `""`                                     |
| `certificates.customCertificate.chainSecret.name`    | Name of the secret containing the certificate chain                                                               | `""`                                     |
| `certificates.customCertificate.chainSecret.key`     | Key of the certificate chain file inside the secret                                                               | `""`                                     |
| `certificates.customCertificate.certificateLocation` | Location in the container to store the certificate                                                                | `/etc/ssl/certs/ssl-cert-snakeoil.pem`   |
| `certificates.customCertificate.keyLocation`         | Location in the container to store the private key                                                                | `/etc/ssl/private/ssl-cert-snakeoil.key` |
| `certificates.customCertificate.chainLocation`       | Location in the container to store the certificate chain                                                          | `/etc/ssl/certs/mychain.pem`             |
| `certificates.customCAs`                             | Defines a list of secrets to import into the container trust store                                                | `[]`                                     |
| `certificates.command`                               | Override default container command (useful when using custom images)                                              | `[]`                                     |
| `certificates.args`                                  | Override default container args (useful when using custom images)                                                 | `[]`                                     |
| `certificates.extraEnvVars`                          | Container sidecar extra environment variables                                                                     | `[]`                                     |
| `certificates.extraEnvVarsCM`                        | ConfigMap with extra environment variables                                                                        | `""`                                     |
| `certificates.extraEnvVarsSecret`                    | Secret with extra environment variables                                                                           | `""`                                     |
| `certificates.image.registry`                        | Container sidecar registry                                                                                        | `docker.io`                              |
| `certificates.image.repository`                      | Container sidecar image repository                                                                                | `bitnami/bitnami-shell`                  |
| `certificates.image.tag`                             | Container sidecar image tag (immutable tags are recommended)                                                      | `11-debian-11-r118`                      |
| `certificates.image.digest`                          | Container sidecar image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                                     |
| `certificates.image.pullPolicy`                      | Container sidecar image pull policy                                                                               | `IfNotPresent`                           |
| `certificates.image.pullSecrets`                     | Container sidecar image pull secrets                                                                              | `[]`                                     |

### NetworkPolicy parameters

| Name                                                          | Description                                                                                                                    | Value   |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `networkPolicy.enabled`                                       | Enable network policies                                                                                                        | `false` |
| `networkPolicy.metrics.enabled`                               | Enable network policy for metrics (prometheus)                                                                                 | `false` |
| `networkPolicy.metrics.namespaceSelector`                     | Monitoring namespace selector labels. These labels will be used to identify the prometheus' namespace.                         | `{}`    |
| `networkPolicy.metrics.podSelector`                           | Monitoring pod selector labels. These labels will be used to identify the Prometheus pods.                                     | `{}`    |
| `networkPolicy.ingress.enabled`                               | Enable network policy for Ingress Proxies                                                                                      | `false` |
| `networkPolicy.ingress.namespaceSelector`                     | Ingress Proxy namespace selector labels. These labels will be used to identify the Ingress Proxy's namespace.                  | `{}`    |
| `networkPolicy.ingress.podSelector`                           | Ingress Proxy pods selector labels. These labels will be used to identify the Ingress Proxy pods.                              | `{}`    |
| `networkPolicy.ingressRules.backendOnlyAccessibleByFrontend`  | Enable ingress rule that makes the backend (mariadb) only accessible by PrestaShop's pods.                                     | `false` |
| `networkPolicy.ingressRules.customBackendSelector`            | Backend selector labels. These labels will be used to identify the backend pods.                                               | `{}`    |
| `networkPolicy.ingressRules.accessOnlyFrom.enabled`           | Enable ingress rule that makes PrestaShop only accessible from a particular origin                                             | `false` |
| `networkPolicy.ingressRules.accessOnlyFrom.namespaceSelector` | Namespace selector label that is allowed to access PrestaShop. This label will be used to identified the allowed namespace(s). | `{}`    |
| `networkPolicy.ingressRules.accessOnlyFrom.podSelector`       | Pods selector label that is allowed to access PrestaShop. This label will be used to identified the allowed pod(s).            | `{}`    |
| `networkPolicy.ingressRules.customRules`                      | Custom network policy ingress rule                                                                                             | `{}`    |
| `networkPolicy.egressRules.denyConnectionsToExternal`         | Enable egress rule that denies outgoing traffic outside the cluster, except for DNS (port 53).                                 | `false` |
| `networkPolicy.egressRules.customRules`                       | Custom network policy rule                                                                                                     | `{}`    |

The above parameters map to the env variables defined in [bitnami/prestashop](https://github.com/bitnami/containers/tree/main/bitnami/prestashop). For more information please refer to the [bitnami/prestashop](https://github.com/bitnami/containers/tree/main/bitnami/prestashop) image documentation.

> **Note**:
>
> For PrestaShop to function correctly, you should specify the `prestashopHost` parameter to specify the FQDN (recommended) or the public IP address of the PrestaShop service.
>
> Optionally, you can specify the `prestashopLoadBalancerIP` parameter to assign a reserved IP address to the PrestaShop service of the chart. However please note that this feature is only available on a few cloud providers (f.e. GKE).
>
> To reserve a public IP address on GKE:
>
> ```console
> $ gcloud compute addresses create prestashop-public-ip
> ```
>
> The reserved IP address can be associated to the PrestaShop service by specifying it as the value of the `prestashopLoadBalancerIP` parameter while installing the chart.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set prestashopUsername=admin,prestashopPassword=password,mariadb.auth.rootPassword=secretpassword \
    oci://registry-1.docker.io/bitnamicharts/prestashop
```

The above command sets the PrestaShop administrator account username and password to `admin` and `password` respectively. Additionally, it sets the MariaDB `root` user password to `secretpassword`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/prestashop
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Image

The `image` parameter allows specifying which image will be pulled for the chart.

#### Private registry

If you configure the `image` value to one in a private registry, you will need to [specify an image pull secret](https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod).

1. Manually create image pull secret(s) in the namespace. See [this YAML example reference](https://kubernetes.io/docs/concepts/containers/images/#creating-a-secret-with-a-docker-config). Consult your image registry's documentation about getting the appropriate secret.
2. Note that the `imagePullSecrets` configuration value cannot currently be passed to helm using the `--set` parameter, so you must supply these using a `values.yaml` file, such as:

    ```yaml
    imagePullSecrets:
      - name: SECRET_NAME
    ```

3. Install the chart

### Setting Pod's affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod's affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, you can use of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

## Persistence

The [Bitnami PrestaShop](https://github.com/bitnami/containers/tree/main/bitnami/prestashop) image stores the PrestaShop data and configurations at the `/bitnami/prestashop` path of the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Parameters](#parameters) section to configure the PVC or to disable persistence.

### Existing PersistentVolumeClaim

1. Create the PersistentVolume
2. Create the PersistentVolumeClaim
3. Install the chart

```console
helm install my-release --set persistence.existingClaim=PVC_NAME oci://registry-1.docker.io/bitnamicharts/prestashop
```

### Host path

#### System compatibility

- The local filesystem accessibility to a container in a pod with `hostPath` has been tested on OSX/MacOS with xhyve, and Linux with VirtualBox.
- Windows has not been tested with the supported VM drivers. Minikube does however officially support [Mounting Host Folders](https://minikube.sigs.k8s.io/docs/handbook/mount/) per pod. Or you may manually sync your container whenever host files are changed with tools like [docker-sync](https://github.com/EugenMayer/docker-sync) or [docker-bg-sync](https://github.com/cweagans/docker-bg-sync).

#### Mounting steps

1. The specified `hostPath` directory must already exist (create one if it does not).
2. Install the chart

   ```console
   helm install my-release --set persistence.hostPath=/PATH/TO/HOST/MOUNT oci://registry-1.docker.io/bitnamicharts/prestashop
   ```

   This will mount the `prestashop-data` volume into the `hostPath` directory. The site data will be persisted if the mount path contains valid data, else the site data will be initialized at first launch.

3. Because the container cannot control the host machine's directory permissions, you must set the PrestaShop file directory permissions yourself and disable or clear PrestaShop cache.

### SSL

One needs to explicitly turn on SSL in the Prestashop administration panel, else a `302` redirect to `http` scheme is returned on any page of the site by default.

To enable SSL on all pages, follow these steps:

- Browse to the administration panel and log in.
- Click "Shop Parameters" in the left navigation panel.
- Set the option "Enable SSL" to "Yes".
- Click the "Save" button.
- Set the (now enabled) option "Enable SSL on all pages" to "Yes".
- Click the "Save" button.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 17.0.0

This major release bumps the MariaDB version to 10.11. Follow the [upstream instructions](https://mariadb.com/kb/en/upgrading-from-mariadb-10-6-to-mariadb-10-11/) for upgrading from MariaDB 10.6 to 10.11. No major issues are expected during the upgrade.

### To 15.0.0

This major release bumps the MariaDB version to 10.6. Follow the [upstream instructions](https://mariadb.com/kb/en/upgrading-from-mariadb-105-to-mariadb-106/) for upgrading from MariaDB 10.5 to 10.6. No major issues are expected during the upgrade.

### To 14.0.0

This major release renames several values in this chart and adds missing features, in order to be inline with the rest of assets in the Bitnami charts repository.

Affected values:

- `service.port` was deprecated. We recommend using `service.ports.http` instead.
- `service.httpsPort` was deprecated. We recommend using `service.ports.https` instead.

Additionally updates the MariaDB subchart to it newest major, 10.0.0, which contains similar changes. Check [MariaDB Upgrading Notes](https://github.com/bitnami/charts/tree/main/bitnami/mariadb#to-1000) for more information.

### To 13.0.0

This version standardizes the way of defining Ingress rules. When configuring a single hostname for the Ingress rule, set the `ingress.hostname` value. When defining more than one, set the `ingress.extraHosts` array. Apart from this case, no issues are expected to appear when upgrading.

### To 12.0.0

[On November 13, 2020, Helm v2 support was formally finished](https://github.com/helm/charts#status-of-the-project), this major version is the result of the required changes applied to the Helm Chart to be able to incorporate the different features added in Helm v3 and to be consistent with the Helm project itself regarding the Helm v2 EOL.

#### What changes were introduced in this major version?

- Previous versions of this Helm Chart use `apiVersion: v1` (installable by both Helm 2 and 3), this Helm Chart was updated to `apiVersion: v2` (installable by Helm 3 only). [Here](https://helm.sh/docs/topics/charts/#the-apiversion-field) you can find more information about the `apiVersion` field.
- Move dependency information from the _requirements.yaml_ to the _Chart.yaml_
- After running `helm dependency update`, a _Chart.lock_ file is generated containing the same structure used in the previous _requirements.lock_
- The different fields present in the _Chart.yaml_ file has been ordered alphabetically in a homogeneous way for all the Bitnami Helm Charts

#### Considerations when upgrading to this version

- If you want to upgrade to this version from a previous one installed with Helm v3, you shouldn't face any issues
- If you want to upgrade to this version using Helm v2, this scenario is not supported as this version doesn't support Helm v2 anymore
- If you installed the previous version with Helm v2 and wants to upgrade to this version with Helm v3, please refer to the [official Helm documentation](https://helm.sh/docs/topics/v2_v3_migration/#migration-use-cases) about migrating from Helm v2 to v3

#### Useful links

- <https://docs.bitnami.com/tutorials/resolve-helm2-helm3-post-migration-issues/>
- <https://helm.sh/docs/topics/v2_v3_migration/>
- <https://helm.sh/blog/migrate-from-helm-v2-to-helm-v3/>

### To 11.0.0

MariaDB dependency version was bumped to a new major version that introduces several incompatilibites. Therefore, backwards compatibility is not guaranteed unless an external database is used. Check [MariaDB Upgrading Notes](https://github.com/bitnami/charts/tree/main/bitnami/mariadb#to-800) for more information.

To upgrade to `11.0.0`, you have two alternatives:

- Install a new Prestashop chart, and migrate your Prestashop site using backup/restore using any [Backup and Restore tool from Prestashop marketplace](https://addons.prestashop.com/en/search?search_query=backup&).
- Reuse the PVC used to hold the MariaDB data on your previous release. To do so, follow the instructions below (the following example assumes that the release name is `prestashop`):

Obtain the credentials and the name of the PVC used to hold the MariaDB data on your current release:

```console
export PRESTASHOP_PASSWORD=$(kubectl get secret --namespace default prestashop -o jsonpath="{.data.prestashop-password}" | base64 -d)
export MARIADB_ROOT_PASSWORD=$(kubectl get secret --namespace default prestashop-mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 -d)
export MARIADB_PASSWORD=$(kubectl get secret --namespace default prestashop-mariadb -o jsonpath="{.data.mariadb-password}" | base64 -d)
export MARIADB_PVC=$(kubectl get pvc -l app.kubernetes.io/instance=prestashop,app.kubernetes.io/name=mariadb,app.kubernetes.io/component=primary -o jsonpath="{.items[0].metadata.name}")
```

Upgrade your release (maintaining the version) disabling MariaDB and scaling Prestashop replicas to 0:

```console
helm upgrade prestashop oci://registry-1.docker.io/bitnamicharts/prestashop --set prestashopPassword=$PRESTASHOP_PASSWORD --set replicaCount=0 --set mariadb.enabled=false --version 10.0.0
```

Finally, upgrade you release to 11.0.0 reusing the existing PVC, and enabling back MariaDB:

```console
helm upgrade prestashop oci://registry-1.docker.io/bitnamicharts/prestashop --set mariadb.primary.persistence.existingClaim=$MARIADB_PVC --set mariadb.auth.rootPassword=$MARIADB_ROOT_PASSWORD --set mariadb.auth.password=$MARIADB_PASSWORD --set prestashopPassword=$PRESTASHOP_PASSWORD
```

You should see the lines below in MariaDB container logs:

```console
$ kubectl logs $(kubectl get pods -l app.kubernetes.io/instance=prestashop,app.kubernetes.io/name=mariadb,app.kubernetes.io/component=primary -o jsonpath="{.items[0].metadata.name}")
...
mariadb 12:13:24.98 INFO  ==> Using persisted data
mariadb 12:13:25.01 INFO  ==> Running mysql_upgrade
...
```

### To 10.0.0

The [Bitnami PrestaShop](https://github.com/bitnami/containers/tree/main/bitnami/prestashop) image was updated to support and enable the "non-root" user approach

If you want to continue to run the container image as the `root` user, you need to set `podSecurityContext.enabled=false` and `containerSecurity.context.enabled=false`.

This upgrade also adapts the chart to the latest Bitnami good practices. Check the Parameters section for more information.

### To 9.0.0

Helm performs a lookup for the object based on its group (apps), version (v1), and kind (Deployment). Also known as its GroupVersionKind, or GVK. Changing the GVK is considered a compatibility breaker from Kubernetes' point of view, so you cannot "upgrade" those objects to the new GVK in-place. Earlier versions of Helm 3 did not perform the lookup correctly which has since been fixed to match the spec.

In <https://github.com/helm/charts/pull/17308> the `apiVersion` of the deployment resources was updated to `apps/v1` in tune with the api's deprecated, resulting in compatibility breakage.

This major version signifies this change.

### To 3.0.0

Backwards compatibility is not guaranteed unless you modify the labels used on the chart's deployments.
Use the workaround below to upgrade from versions previous to 3.0.0. The following example assumes that the release name is prestashop:

```console
kubectl patch deployment prestashop-prestashop --type=json -p='[{"op": "remove", "path": "/spec/selector/matchLabels/chart"}]'
kubectl delete statefulset prestashop-mariadb --cascade=false
```

## Community supported solution

Please, note this Helm chart is a community-supported solution. This means that the Bitnami team is not actively working on new features/improvements nor providing support through GitHub Issues for this Helm chart. Any new issue will stay open for 20 days to allow the community to contribute, after 15 days without activity the issue will be marked as stale being closed after 5 days.

The Bitnami team will review any PR that is created, feel free to create a PR if you find any issue or want to implement a new feature.

New versions are not going to be affected. Once a new version is released in the upstream project, the Bitnami container image will be updated to use the latest version.

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