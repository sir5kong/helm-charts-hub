<!--- app-name: phpBB -->

# phpBB packaged by Bitnami

phpBB is a popular bulletin board that features robust messaging capabilities such as flat message structure, subforums, topic split/merge/lock, user groups, full-text search, and attachments.

[Overview of phpBB](http://www.phpbb.com)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/phpbb
```

## Introduction

This chart bootstraps a [phpBB](https://github.com/bitnami/containers/tree/main/bitnami/phpbb) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages the [Bitnami MariaDB chart](https://github.com/bitnami/charts/tree/main/bitnami/mariadb) which is required for bootstrapping a MariaDB deployment for the database requirements of the phpBB application.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/phpbb
```

The command deploys phpBB on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

| Name                | Description                                                                                               | Value |
| ------------------- | --------------------------------------------------------------------------------------------------------- | ----- |
| `kubeVersion`       | Force target Kubernetes version (using Helm capabilities if not set)                                      | `""`  |
| `nameOverride`      | String to partially override common.names.fullname template (will maintain the release name)              | `""`  |
| `fullnameOverride`  | String to fully override common.names.fullname template                                                   | `""`  |
| `namespaceOverride` | String to fully override common.names.namespace                                                           | `""`  |
| `commonAnnotations` | Common annotations to add to all phpBB resources (sub-charts are not considered). Evaluated as a template | `{}`  |
| `commonLabels`      | Common labels to add to all phpBB resources (sub-charts are not considered). Evaluated as a template      | `{}`  |
| `extraDeploy`       | Array of extra objects to deploy with the release (evaluated as a template)                               | `[]`  |

### phpBB parameters

| Name                                    | Description                                                                                                                                               | Value                   |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `image.registry`                        | phpBB image registry                                                                                                                                      | `docker.io`             |
| `image.repository`                      | phpBB image repository                                                                                                                                    | `bitnami/phpbb`         |
| `image.tag`                             | phpBB image tag (immutable tags are recommended)                                                                                                          | `3.3.10-debian-11-r28`  |
| `image.digest`                          | phpBB image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                                                     | `""`                    |
| `image.pullPolicy`                      | phpBB image pull policy                                                                                                                                   | `IfNotPresent`          |
| `image.pullSecrets`                     | Specify docker-registry secret names as an array                                                                                                          | `[]`                    |
| `image.debug`                           | Specify if debug logs should be enabled                                                                                                                   | `false`                 |
| `replicaCount`                          | Number of replicas (requires ReadWriteMany PVC support)                                                                                                   | `1`                     |
| `phpbbSkipInstall`                      | Skip phpBB installation wizard. Useful for migrations and restoring from SQL dump                                                                         | `no`                    |
| `phpbbDisableSessionValidation`         | Disable session validation                                                                                                                                | `yes`                   |
| `phpbbUsername`                         | User of the application                                                                                                                                   | `user`                  |
| `phpbbPassword`                         | Application password                                                                                                                                      | `""`                    |
| `phpbbEmail`                            | Admin email                                                                                                                                               | `user@example.com`      |
| `allowEmptyPassword`                    | Allow DB blank passwords                                                                                                                                  | `no`                    |
| `command`                               | Override default container command (useful when using custom images)                                                                                      | `[]`                    |
| `args`                                  | Override default container args (useful when using custom images)                                                                                         | `[]`                    |
| `hostAliases`                           | Add deployment host aliases                                                                                                                               | `[]`                    |
| `updateStrategy.type`                   | Update strategy - only really applicable for deployments with RWO PVs attached                                                                            | `RollingUpdate`         |
| `extraEnvVars`                          | An array to add extra env vars                                                                                                                            | `[]`                    |
| `extraEnvVarsCM`                        | ConfigMap with extra environment variables                                                                                                                | `""`                    |
| `extraEnvVarsSecret`                    | Secret with extra environment variables                                                                                                                   | `""`                    |
| `extraVolumes`                          | Extra volumes to add to the deployment. Requires setting `extraVolumeMounts`                                                                              | `[]`                    |
| `extraVolumeMounts`                     | Extra volume mounts to add to the container. Normally used with `extraVolumes`                                                                            | `[]`                    |
| `initContainers`                        | Extra init containers to add to the deployment                                                                                                            | `[]`                    |
| `sidecars`                              | Extra sidecar containers to add to the deployment                                                                                                         | `[]`                    |
| `tolerations`                           | Tolerations for pod assignment                                                                                                                            | `[]`                    |
| `existingSecret`                        | Use existing secret for the application password                                                                                                          | `""`                    |
| `volumePermissions.enabled`             | Enable init container that changes volume permissions in the data directory (for cases where the default k8s `runAsUser` and `fsUser` values do not work) | `false`                 |
| `volumePermissions.image.registry`      | Init container volume-permissions image registry                                                                                                          | `docker.io`             |
| `volumePermissions.image.repository`    | Init container volume-permissions image repository                                                                                                        | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`           | Init container volume-permissions image tag (immutable tags are recommended)                                                                              | `11-debian-11-r118`     |
| `volumePermissions.image.digest`        | Init container volume-permissions image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                         | `""`                    |
| `volumePermissions.image.pullPolicy`    | Init container volume-permissions image pull policy                                                                                                       | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`   | Specify docker-registry secret names as an array                                                                                                          | `[]`                    |
| `volumePermissions.resources.limits`    | The resources limits for the container                                                                                                                    | `{}`                    |
| `volumePermissions.resources.requests`  | The requested resources for the container                                                                                                                 | `{}`                    |
| `smtpHost`                              | SMTP host                                                                                                                                                 | `""`                    |
| `smtpPort`                              | SMTP port                                                                                                                                                 | `""`                    |
| `smtpUser`                              | SMTP user                                                                                                                                                 | `""`                    |
| `smtpPassword`                          | SMTP password                                                                                                                                             | `""`                    |
| `smtpProtocol`                          | SMTP Protocol (options: ssl,tls, nil)                                                                                                                     | `""`                    |
| `containerPorts`                        | Container ports                                                                                                                                           | `{}`                    |
| `persistence.enabled`                   | Enable persistence using PVC                                                                                                                              | `true`                  |
| `persistence.storageClass`              | Database data Persistent Volume Storage Class                                                                                                             | `""`                    |
| `persistence.accessModes`               | PVC Access Mode for phpBB volume                                                                                                                          | `["ReadWriteOnce"]`     |
| `persistence.size`                      | PVC Storage Request for phpBB volume                                                                                                                      | `8Gi`                   |
| `persistence.existingClaim`             | A manually managed Persistent Volume Claim                                                                                                                | `""`                    |
| `persistence.hostPath`                  | Host mount path for phpBB volume                                                                                                                          | `""`                    |
| `persistence.annotations`               | Persistent Volume Claim annotations                                                                                                                       | `{}`                    |
| `podAffinityPreset`                     | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                       | `""`                    |
| `podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                  | `soft`                  |
| `nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                 | `""`                    |
| `nodeAffinityPreset.key`                | Node label key to match Ignored if `affinity` is set.                                                                                                     | `""`                    |
| `nodeAffinityPreset.values`             | Node label values to match. Ignored if `affinity` is set.                                                                                                 | `[]`                    |
| `affinity`                              | Affinity for pod assignment. Evaluated as a template.                                                                                                     | `{}`                    |
| `nodeSelector`                          | Node labels for pod assignment. Evaluated as a template.                                                                                                  | `{}`                    |
| `resources.requests`                    | The requested resources for the container                                                                                                                 | `{}`                    |
| `resources.limits`                      | The resources limits for the container                                                                                                                    | `{}`                    |
| `podSecurityContext.enabled`            | Enable phpBB pods' Security Context                                                                                                                       | `true`                  |
| `podSecurityContext.fsGroup`            | phpBB pods' group ID                                                                                                                                      | `1001`                  |
| `containerSecurityContext.enabled`      | Enable phpBB containers' Security Context                                                                                                                 | `true`                  |
| `containerSecurityContext.runAsUser`    | phpBB containers' Security Context runAsUser                                                                                                              | `1001`                  |
| `containerSecurityContext.runAsNonRoot` | phpBB containers' Security Context runAsNonRoot                                                                                                           | `true`                  |
| `startupProbe.enabled`                  | Enable startupProbe                                                                                                                                       | `false`                 |
| `startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                                                                    | `600`                   |
| `startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                                                           | `10`                    |
| `startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                                                          | `5`                     |
| `startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                                                                        | `6`                     |
| `startupProbe.successThreshold`         | Success threshold for startupProbe                                                                                                                        | `1`                     |
| `livenessProbe.enabled`                 | Enable livenessProbe                                                                                                                                      | `true`                  |
| `livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                                                                   | `600`                   |
| `livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                                                          | `10`                    |
| `livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                                                                         | `5`                     |
| `livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                                                                       | `6`                     |
| `livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                                                                       | `1`                     |
| `readinessProbe.enabled`                | Enable readinessProbe                                                                                                                                     | `true`                  |
| `readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                                                                  | `30`                    |
| `readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                                                                         | `5`                     |
| `readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                                                                        | `3`                     |
| `readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                                                                      | `6`                     |
| `readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                                                                      | `1`                     |
| `customStartupProbe`                    | Override default startup probe                                                                                                                            | `{}`                    |
| `customLivenessProbe`                   | Override default liveness probe                                                                                                                           | `{}`                    |
| `customReadinessProbe`                  | Override default readiness probe                                                                                                                          | `{}`                    |
| `priorityClassName`                     | Define the priority class name to use for the phpbb pods                                                                                                  | `""`                    |
| `schedulerName`                         | Name of the k8s scheduler (other than default)                                                                                                            | `""`                    |
| `topologySpreadConstraints`             | Topology Spread Constraints for pod assignment                                                                                                            | `[]`                    |
| `lifecycleHooks`                        | LifecycleHook to set additional configuration before or after startup                                                                                     | `{}`                    |
| `podAnnotations`                        | Pod annotations                                                                                                                                           | `{}`                    |
| `podLabels`                             | Pod extra labels                                                                                                                                          | `{}`                    |

### Traffic Exposure Parameters

| Name                               | Description                                                                                                                      | Value                    |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.type`                     | Kubernetes Service type                                                                                                          | `LoadBalancer`           |
| `service.ports.http`               | Service HTTP port                                                                                                                | `80`                     |
| `service.ports.https`              | Service HTTPS port                                                                                                               | `443`                    |
| `service.nodePorts.http`           | Kubernetes HTTP node port                                                                                                        | `""`                     |
| `service.nodePorts.https`          | Kubernetes HTTPS node port                                                                                                       | `""`                     |
| `service.externalTrafficPolicy`    | Enable client source IP preservation                                                                                             | `Cluster`                |
| `service.clusterIP`                | phpbb service Cluster IP                                                                                                         | `""`                     |
| `service.loadBalancerIP`           | phpbb service Load Balancer IP                                                                                                   | `""`                     |
| `service.loadBalancerSourceRanges` | phpbb service Load Balancer sources                                                                                              | `[]`                     |
| `service.extraPorts`               | Extra ports to expose (normally used with the `sidecar` value)                                                                   | `[]`                     |
| `service.annotations`              | Additional custom annotations for phpbb service                                                                                  | `{}`                     |
| `service.sessionAffinity`          | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                             | `None`                   |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `ingress.enabled`                  | Set to true to enable ingress record generation                                                                                  | `false`                  |
| `ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.apiVersion`               | Override API Version (automatically detected if not set)                                                                         | `""`                     |
| `ingress.hostname`                 | Default host for the ingress resource                                                                                            | `phpbb.local`            |
| `ingress.path`                     | The Path to phpBB. You may need to set this to '/*' in order to use this with ALB ingress controllers.                           | `/`                      |
| `ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.tls`                      | Enable TLS configuration for the hostname defined at ingress.hostname parameter                                                  | `false`                  |
| `ingress.extraHosts`               | The list of additional hostnames to be covered with this ingress record.                                                         | `[]`                     |
| `ingress.extraPaths`               | Any additional arbitrary paths that may need to be added to the ingress under the main host.                                     | `[]`                     |
| `ingress.extraTls`                 | The tls configuration for additional hostnames to be covered with this ingress record.                                           | `[]`                     |
| `ingress.secrets`                  | If you're providing your own certificates, please use this to add the certificates as secrets                                    | `[]`                     |
| `ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### Database parameters

| Name                                        | Description                                                                          | Value               |
| ------------------------------------------- | ------------------------------------------------------------------------------------ | ------------------- |
| `mariadb.enabled`                           | Whether to deploy a mariadb server to satisfy the applications database requirements | `true`              |
| `mariadb.architecture`                      | MariaDB architecture. Allowed values: `standalone` or `replication`                  | `standalone`        |
| `mariadb.auth.rootPassword`                 | Password for the MariaDB `root` user                                                 | `""`                |
| `mariadb.auth.database`                     | Database name to create                                                              | `bitnami_phpbb`     |
| `mariadb.auth.username`                     | Database user to create                                                              | `bn_phpbb`          |
| `mariadb.auth.password`                     | Password for the database                                                            | `""`                |
| `mariadb.primary.persistence.enabled`       | Enable database persistence using PVC                                                | `true`              |
| `mariadb.primary.persistence.storageClass`  | MariaDB primary persistent volume storage Class                                      | `""`                |
| `mariadb.primary.persistence.accessModes`   | PVC Access Modes for phpBB volume                                                    | `["ReadWriteOnce"]` |
| `mariadb.primary.persistence.size`          | Database Persistent Volume Size                                                      | `8Gi`               |
| `mariadb.primary.persistence.hostPath`      | Host mount path for MariaDB volume                                                   | `""`                |
| `mariadb.primary.persistence.existingClaim` | Name of an existing `PersistentVolumeClaim` for MariaDB primary replicas             | `""`                |
| `externalDatabase.existingSecret`           | Use existing secret (ignores previous password)                                      | `""`                |
| `externalDatabase.host`                     | Host of the existing database                                                        | `""`                |
| `externalDatabase.port`                     | Port of the existing database                                                        | `3306`              |
| `externalDatabase.user`                     | Existing username in the external db                                                 | `bn_phpbb`          |
| `externalDatabase.password`                 | Password for the above username                                                      | `""`                |
| `externalDatabase.database`                 | Name of the existing database                                                        | `bitnami_phpbb`     |

### Metrics parameters

| Name                        | Description                                                                                                     | Value                     |
| --------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `metrics.enabled`           | Start a side-car prometheus exporter                                                                            | `false`                   |
| `metrics.image.registry`    | Apache exporter image registry                                                                                  | `docker.io`               |
| `metrics.image.repository`  | Apache exporter image repository                                                                                | `bitnami/apache-exporter` |
| `metrics.image.tag`         | Apache exporter image tag (immutable tags are recommended)                                                      | `0.13.3-debian-11-r9`     |
| `metrics.image.digest`      | Apache exporter image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                      |
| `metrics.image.pullPolicy`  | Image pull policy                                                                                               | `IfNotPresent`            |
| `metrics.image.pullSecrets` | Specify docker-registry secret names as an array                                                                | `[]`                      |
| `metrics.resources`         | Metrics exporter resource requests and limits                                                                   | `{}`                      |
| `metrics.podAnnotations`    | Additional annotations for Metrics exporter pod                                                                 | `{}`                      |

### NetworkPolicy parameters

| Name                                                          | Description                                                                                                               | Value   |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------- |
| `networkPolicy.enabled`                                       | Enable network policies                                                                                                   | `false` |
| `networkPolicy.metrics.enabled`                               | Enable network policy for metrics (prometheus)                                                                            | `false` |
| `networkPolicy.metrics.namespaceSelector`                     | Monitoring namespace selector labels. These labels will be used to identify the prometheus' namespace.                    | `{}`    |
| `networkPolicy.metrics.podSelector`                           | Monitoring pod selector labels. These labels will be used to identify the Prometheus pods.                                | `{}`    |
| `networkPolicy.ingress.enabled`                               | Enable network policy for Ingress Proxies                                                                                 | `false` |
| `networkPolicy.ingress.namespaceSelector`                     | Ingress Proxy namespace selector labels. These labels will be used to identify the Ingress Proxy's namespace.             | `{}`    |
| `networkPolicy.ingress.podSelector`                           | Ingress Proxy pods selector labels. These labels will be used to identify the Ingress Proxy pods.                         | `{}`    |
| `networkPolicy.ingressRules.backendOnlyAccessibleByFrontend`  | Enable ingress rule that makes the backend (mariadb) only accessible by phpBB's pods.                                     | `false` |
| `networkPolicy.ingressRules.customBackendSelector`            | Backend selector labels. These labels will be used to identify the backend pods.                                          | `{}`    |
| `networkPolicy.ingressRules.accessOnlyFrom.enabled`           | Enable ingress rule that makes phpBB only accessible from a particular origin                                             | `false` |
| `networkPolicy.ingressRules.accessOnlyFrom.namespaceSelector` | Namespace selector label that is allowed to access phpBB. This label will be used to identified the allowed namespace(s). | `{}`    |
| `networkPolicy.ingressRules.accessOnlyFrom.podSelector`       | Pods selector label that is allowed to access phpBB. This label will be used to identified the allowed pod(s).            | `{}`    |
| `networkPolicy.ingressRules.customRules`                      | Custom network policy ingress rule                                                                                        | `{}`    |
| `networkPolicy.egressRules.denyConnectionsToExternal`         | Enable egress rule that denies outgoing traffic outside the cluster, except for DNS (port 53).                            | `false` |
| `networkPolicy.egressRules.customRules`                       | Custom network policy rule                                                                                                | `{}`    |

The above parameters map to the env variables defined in [bitnami/phpbb](https://github.com/bitnami/containers/tree/main/bitnami/phpbb). For more information please refer to the [bitnami/phpbb](https://github.com/bitnami/containers/tree/main/bitnami/phpbb) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set phpbbUsername=admin,phpbbPassword=password,mariadb.mariadbRootPassword=secretpassword \
    oci://registry-1.docker.io/bitnamicharts/phpbb
```

The above command sets the phpBB administrator account username and password to `admin` and `password` respectively. Additionally, it sets the MariaDB `root` user password to `secretpassword`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/phpbb
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Ingress without TLS

For using ingress (example without TLS):

```console
ingress.enabled=True
ingress.hosts[0]=phpbb.domain.com
serviceType=ClusterIP
phpbbUsername=admin
phpbbPassword=password
mariadb.mariadbRootPassword=secretpassword
```

These are the *3 mandatory parameters* when *Ingress* is desired: `ingress.enabled=True`, `ingress.hosts[0]=phpbb.domain.com` and `serviceType=ClusterIP`

### Ingress TLS

If your cluster allows automatic creation/retrieval of TLS certificates (e.g. [kube-lego](https://github.com/jetstack/kube-lego)), please refer to the documentation for that mechanism.

To manually configure TLS, first create/retrieve a key & certificate pair for the address(es) you wish to protect. Then create a TLS secret (named `phpbb-server-tls` in this example) in the namespace. Include the secret's name, along with the desired hostnames, in the Ingress TLS section of your custom `values.yaml` file:

```yaml
ingress:
  ## If true, phpBB server Ingress will be created
  ##
  enabled: true

  ## phpBB server Ingress annotations
  ##
  annotations: {}
  #   kubernetes.io/ingress.class: nginx
  #   kubernetes.io/tls-acme: 'true'

  ## phpBB server Ingress hostnames
  ## Must be provided if Ingress is enabled
  ##
  hosts:
    - phpbb.domain.com

  ## phpBB server Ingress TLS configuration
  ## Secrets must be manually created in the namespace
  ##
  tls:
    - secretName: phpbb-server-tls
      hosts:
        - phpbb.domain.com
```

## Persistence

The [Bitnami phpBB](https://github.com/bitnami/containers/tree/main/bitnami/phpbb) image stores the phpBB data and configurations at the `/bitnami/phpbb` and `/bitnami/apache` paths of the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, vpshere, and minikube.
See the [Parameters](#parameters) section to configure the PVC or to disable persistence.
You may want to review the [PV reclaim policy](https://kubernetes.io/docs/tasks/administer-cluster/change-pv-reclaim-policy/) and update as required. By default, it's set to delete, and when phpBB is uninstalled, data is also removed.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 13.0.0

This major release bumps the MariaDB version to 10.11. Follow the [upstream instructions](https://mariadb.com/kb/en/upgrading-from-mariadb-10-6-to-mariadb-10-11/) for upgrading from MariaDB 10.6 to 10.11. No major issues are expected during the upgrade.

### To 12.0.0

This major release bumps the MariaDB version to 10.6. Follow the [upstream instructions](https://mariadb.com/kb/en/upgrading-from-mariadb-105-to-mariadb-106/) for upgrading from MariaDB 10.5 to 10.6. No major issues are expected during the upgrade.

### To 11.0.0

This major release renames several values in this chart and adds missing features, in order to be inline with the rest of assets in the Bitnami charts repository.

Affected values:

- `service.port` was deprecated. We recommend using `service.ports.http` instead.
- `service.httpsPort` was deprecated. We recommend using `service.ports.https` instead.

Additionally updates the MariaDB subchart to it newest major, 10.0.0, which contains similar changes. Check [MariaDB Upgrading Notes](https://github.com/bitnami/charts/tree/main/bitnami/mariadb#to-1000) for more information.

### To 10.0.0

This version standardizes the way of defining Ingress rules. When configuring a single hostname for the Ingress rule, set the `ingress.hostname` value. When defining more than one, set the `ingress.extraHosts` array. Apart from this case, no issues are expected to appear when upgrading.

### To 9.0.0

In this major there were two main changes introduced:

1. Adaptation to Helm v2 EOL
2. Updated MariaDB dependency version

Please read the update notes carefully.

#### 1. Adaptation to Helm v2 EOL

[On November 13, 2020, Helm v2 support was formally finished](https://github.com/helm/charts#status-of-the-project), this major version is the result of the required changes applied to the Helm Chart to be able to incorporate the different features added in Helm v3 and to be consistent with the Helm project itself regarding the Helm v2 EOL.

##### What changes were introduced in this major version?

- Previous versions of this Helm Chart use `apiVersion: v1` (installable by both Helm 2 and 3), this Helm Chart was updated to `apiVersion: v2` (installable by Helm 3 only). [Here](https://helm.sh/docs/topics/charts/#the-apiversion-field) you can find more information about the `apiVersion` field.
- Move dependency information from the *requirements.yaml* to the *Chart.yaml*
- After running `helm dependency update`, a *Chart.lock* file is generated containing the same structure used in the previous *requirements.lock*
- The different fields present in the *Chart.yaml* file has been ordered alphabetically in a homogeneous way for all the Bitnami Helm Charts

##### Considerations when upgrading to this version

- If you want to upgrade to this version from a previous one installed with Helm v3, you shouldn't face any issues
- If you want to upgrade to this version using Helm v2, this scenario is not supported as this version doesn't support Helm v2 anymore
- If you installed the previous version with Helm v2 and wants to upgrade to this version with Helm v3, please refer to the [official Helm documentation](https://helm.sh/docs/topics/v2_v3_migration/#migration-use-cases) about migrating from Helm v2 to v3

##### Useful links

- <https://docs.bitnami.com/tutorials/resolve-helm2-helm3-post-migration-issues/>
- <https://helm.sh/docs/topics/v2_v3_migration/>
- <https://helm.sh/blog/migrate-from-helm-v2-to-helm-v3/>

#### 2. Updated MariaDB dependency version

In this major the MariaDB dependency version was also bumped to a new major version that introduces several incompatilibites. Therefore, backwards compatibility is not guaranteed unless an external database is used. Check [MariaDB Upgrading Notes](https://github.com/bitnami/charts/tree/main/bitnami/mariadb#to-800) for more information.

To upgrade to `9.0.0`, it should be done reusing the PVCs used to hold both the MariaDB and phpBB data on your previous release. To do so, follow the instructions below (the following example assumes that the release name is `phpbb`):

> NOTE: Please, create a backup of your database before running any of those actions. The steps below would be only valid if your application (e.g. any plugins or custom code) is compatible with MariaDB 10.5.x

Obtain the credentials and the names of the PVCs used to hold both the MariaDB and phpBB data on your current release:

```console
export PHPBB_PASSWORD=$(kubectl get secret --namespace default phpbb -o jsonpath="{.data.phpbb-password}" | base64 -d)
export MARIADB_ROOT_PASSWORD=$(kubectl get secret --namespace default phpbb-mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 -d)
export MARIADB_PASSWORD=$(kubectl get secret --namespace default phpbb-mariadb -o jsonpath="{.data.mariadb-password}" | base64 -d)
export MARIADB_PVC=$(kubectl get pvc -l app=mariadb,component=master,release=phpbb -o jsonpath="{.items[0].metadata.name}")
```

Upgrade your release (maintaining the version) disabling MariaDB and scaling phpBB replicas to 0:

```console
helm upgrade phpbb oci://registry-1.docker.io/bitnamicharts/phpbb --set phpbbPassword=$PHPBB_PASSWORD --set replicaCount=0 --set mariadb.enabled=false --version 8.0.5
```

Finally, upgrade you release to 9.0.0 reusing the existing PVC, and enabling back MariaDB:

```console
helm upgrade phpbb oci://registry-1.docker.io/bitnamicharts/phpbb --set mariadb.primary.persistence.existingClaim=$MARIADB_PVC --set mariadb.auth.rootPassword=$MARIADB_ROOT_PASSWORD --set mariadb.auth.password=$MARIADB_PASSWORD --set phpbbPassword=$PHPBB_PASSWORD
```

You should see the lines below in MariaDB container logs:

```console
$ kubectl logs $(kubectl get pods -l app.kubernetes.io/instance=phpbb,app.kubernetes.io/name=mariadb,app.kubernetes.io/component=primary -o jsonpath="{.items[0].metadata.name}")
...
mariadb 12:13:24.98 INFO  ==> Using persisted data
mariadb 12:13:25.01 INFO  ==> Running mysql_upgrade
...
```

### To 8.0.0

The [Bitnami phpBB](https://github.com/bitnami/containers/tree/main/bitnami/phpbb) image was migrated to a "non-root" user approach. Previously the container ran as the `root` user and the Apache daemon was started as the `daemon` user. From now on, both the container and the Apache daemon run as user `1001`. You can revert this behavior by setting the parameters `containerSecurityContext.runAsUser` to `root`.

Consequences:

- The HTTP/HTTPS ports exposed by the container are now `8080/8443` instead of `80/443`.
- Backwards compatibility is not guaranteed.

To upgrade to `8.0.0`, backup phpBB data and the previous MariaDB databases, install a new phpBB chart and import the backups and data, ensuring the `1001` user has the appropriate permissions on the migrated volume.

This upgrade also adapts the chart to the latest Bitnami good practices. Check the Parameters section for more information.

### To 7.0.0

Helm performs a lookup for the object based on its group (apps), version (v1), and kind (Deployment). Also known as its GroupVersionKind, or GVK. Changing the GVK is considered a compatibility breaker from Kubernetes' point of view, so you cannot "upgrade" those objects to the new GVK in-place. Earlier versions of Helm 3 did not perform the lookup correctly which has since been fixed to match the spec.

In <https://github.com/helm/charts/pull/17307> the `apiVersion` of the deployment resources was updated to `apps/v1` in tune with the api's deprecated, resulting in compatibility breakage.

This major version signifies this change.

### To 3.0.0

Backwards compatibility is not guaranteed unless you modify the labels used on the chart's deployments.
Use the workaround below to upgrade from versions previous to 3.0.0. The following example assumes that the release name is phpbb:

```console
kubectl patch deployment phpbb-phpbb --type=json -p='[{"op": "remove", "path": "/spec/selector/matchLabels/chart"}]'
kubectl delete statefulset phpbb-mariadb --cascade=false
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