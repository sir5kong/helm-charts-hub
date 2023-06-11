<!--- app-name: WildFly -->

# WildFly packaged by Bitnami

Wildfly is a lightweight, open source application server, formerly known as JBoss, that implements the latest enterprise Java standards.

[Overview of WildFly](http://www.wildfly.org/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/wildfly
```

## Introduction

This chart bootstraps a [WildFly](https://github.com/bitnami/containers/tree/main/bitnami/wildfly) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

WildFly is written in Java, and implements the Java Platform, Enterprise Edition (Java EE) specification.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/wildfly
```

These commands deploy WildFly on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

| Name                     | Description                                                                             | Value           |
| ------------------------ | --------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Override Kubernetes version                                                             | `""`            |
| `nameOverride`           | String to partially override common.names.fullname                                      | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname                                          | `""`            |
| `commonLabels`           | Labels to add to all deployed objects                                                   | `{}`            |
| `commonAnnotations`      | Annotations to add to all deployed objects                                              | `{}`            |
| `clusterDomain`          | Kubernetes cluster domain name                                                          | `cluster.local` |
| `extraDeploy`            | Array of extra objects to deploy with the release                                       | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`         |
| `diagnosticMode.command` | Command to override all containers in the the deployment(s)/statefulset(s)              | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the the deployment(s)/statefulset(s)                 | `["infinity"]`  |

### WildFly Image parameters

| Name                | Description                                                                                             | Value                 |
| ------------------- | ------------------------------------------------------------------------------------------------------- | --------------------- |
| `image.registry`    | WildFly image registry                                                                                  | `docker.io`           |
| `image.repository`  | WildFly image repository                                                                                | `bitnami/wildfly`     |
| `image.tag`         | WildFly image tag (immutable tags are recommended)                                                      | `28.0.1-debian-11-r0` |
| `image.digest`      | WildFly image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `image.pullPolicy`  | WildFly image pull policy                                                                               | `IfNotPresent`        |
| `image.pullSecrets` | WildFly image pull secrets                                                                              | `[]`                  |
| `image.debug`       | Enable image debug mode                                                                                 | `false`               |

### WildFly Configuration parameters

| Name                      | Description                                                            | Value   |
| ------------------------- | ---------------------------------------------------------------------- | ------- |
| `wildflyUsername`         | WildFly username                                                       | `user`  |
| `wildflyPassword`         | WildFly user password                                                  | `""`    |
| `exposeManagementConsole` | Allows exposing the WildFly Management console outside the cluster     | `false` |
| `command`                 | Override default container command (useful when using custom images)   | `[]`    |
| `args`                    | Override default container args (useful when using custom images)      | `[]`    |
| `lifecycleHooks`          | for the container to automate configuration before or after startup    | `{}`    |
| `extraEnvVars`            | Array with extra environment variables to add to the WildFly container | `[]`    |
| `extraEnvVarsCM`          | Name of existing ConfigMap containing extra env vars                   | `""`    |
| `extraEnvVarsSecret`      | Name of existing Secret containing extra env vars                      | `""`    |

### WildFly deployment parameters

| Name                                    | Description                                                                               | Value           |
| --------------------------------------- | ----------------------------------------------------------------------------------------- | --------------- |
| `replicaCount`                          | Number of Wildfly replicas to deploy                                                      | `1`             |
| `updateStrategy.type`                   | WildFly deployment strategy type                                                          | `RollingUpdate` |
| `hostAliases`                           | WildFly pod host aliases                                                                  | `[]`            |
| `extraVolumes`                          | Optionally specify extra list of additional volumes for WildFly pods                      | `[]`            |
| `extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for WildFly container(s)         | `[]`            |
| `serviceAccountName`                    | Name of existing ServiceAccount to be connected                                           | `""`            |
| `sidecars`                              | Add additional sidecar containers to the WildFly pod                                      | `[]`            |
| `initContainers`                        | Add additional init containers to the WildFly pods                                        | `[]`            |
| `podLabels`                             | Extra labels for WildFly pods                                                             | `{}`            |
| `podAnnotations`                        | Annotations for WildFly pods                                                              | `{}`            |
| `podAffinityPreset`                     | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `nodeAffinityPreset.key`                | Node label key to match. Ignored if `affinity` is set                                     | `""`            |
| `nodeAffinityPreset.values`             | Node label values to match. Ignored if `affinity` is set                                  | `[]`            |
| `affinity`                              | Affinity for pod assignment                                                               | `{}`            |
| `nodeSelector`                          | Node labels for pod assignment                                                            | `{}`            |
| `tolerations`                           | Tolerations for pod assignment                                                            | `{}`            |
| `priorityClassName`                     | Pod priorityClassName                                                                     | `""`            |
| `schedulerName`                         | Name of the k8s scheduler (other than default)                                            | `""`            |
| `topologySpreadConstraints`             | Topology Spread Constraints for pod assignment                                            | `[]`            |
| `resources.limits`                      | The resources limits for the WildFly container                                            | `{}`            |
| `resources.requests`                    | The requested resources for the WildFly container                                         | `{}`            |
| `containerPorts.http`                   | WildFly HTTP container port                                                               | `8080`          |
| `containerPorts.mgmt`                   | WildFly HTTPS container port                                                              | `9990`          |
| `extraContainerPorts`                   | Array with extra container ports to add to the WildFly container                          | `[]`            |
| `podSecurityContext.enabled`            | Enabled WildFly pods' Security Context                                                    | `true`          |
| `podSecurityContext.fsGroup`            | Set WildFly pod's Security Context fsGroup                                                | `1001`          |
| `containerSecurityContext.enabled`      | Enabled WildFly containers' Security Context                                              | `true`          |
| `containerSecurityContext.runAsUser`    | Set WildFly container's Security Context runAsUser                                        | `1001`          |
| `containerSecurityContext.runAsNonRoot` | Set WildFly container's Security Context runAsNonRoot                                     | `true`          |
| `startupProbe.enabled`                  | Enable startupProbe                                                                       | `false`         |
| `startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                    | `120`           |
| `startupProbe.periodSeconds`            | Period seconds for startupProbe                                                           | `10`            |
| `startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                          | `5`             |
| `startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                        | `6`             |
| `startupProbe.successThreshold`         | Success threshold for startupProbe                                                        | `1`             |
| `livenessProbe.enabled`                 | Enable livenessProbe                                                                      | `true`          |
| `livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                   | `120`           |
| `livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                          | `10`            |
| `livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                         | `5`             |
| `livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                       | `6`             |
| `livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                       | `1`             |
| `readinessProbe.enabled`                | Enable readinessProbe                                                                     | `true`          |
| `readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                  | `30`            |
| `readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                         | `5`             |
| `readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                        | `3`             |
| `readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                      | `3`             |
| `readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                      | `1`             |
| `customStartupProbe`                    | Custom startupProbe that overrides the default one                                        | `{}`            |
| `customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                       | `{}`            |
| `customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                      | `{}`            |

### Traffic Exposure Parameters

| Name                               | Description                                                                                                                                 | Value                    |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.type`                     | WildFly service type                                                                                                                        | `LoadBalancer`           |
| `service.ports.http`               | WildFly service HTTP port                                                                                                                   | `80`                     |
| `service.ports.mgmt`               | WildFly service management console port                                                                                                     | `9990`                   |
| `service.nodePorts.http`           | Node port for HTTP                                                                                                                          | `""`                     |
| `service.nodePorts.mgmt`           | Node port for Management console                                                                                                            | `""`                     |
| `service.clusterIP`                | WildFly service Cluster IP                                                                                                                  | `""`                     |
| `service.loadBalancerIP`           | WildFly service Load Balancer IP                                                                                                            | `""`                     |
| `service.loadBalancerSourceRanges` | WildFly service Load Balancer sources                                                                                                       | `[]`                     |
| `service.externalTrafficPolicy`    | WildFly service external traffic policy                                                                                                     | `Cluster`                |
| `service.annotations`              | Additional custom annotations for WildFly service                                                                                           | `{}`                     |
| `service.extraPorts`               | Extra ports to expose on WildFly service                                                                                                    | `[]`                     |
| `service.sessionAffinity`          | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                                        | `None`                   |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                                 | `{}`                     |
| `ingress.enabled`                  | Enable ingress record generation for WildFly                                                                                                | `false`                  |
| `ingress.pathType`                 | Ingress path type                                                                                                                           | `ImplementationSpecific` |
| `ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                               | `""`                     |
| `ingress.hostname`                 | Default host for the ingress record                                                                                                         | `wildfly.local`          |
| `ingress.path`                     | Default path for the ingress record                                                                                                         | `/`                      |
| `ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations.            | `{}`                     |
| `ingress.tls`                      | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                               | `false`                  |
| `ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                                  | `[]`                     |
| `ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                                       | `[]`                     |
| `ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                                         | `[]`                     |
| `ingress.secrets`                  | Custom TLS certificates as secrets                                                                                                          | `[]`                     |
| `ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                               | `""`                     |
| `ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                                     | `[]`                     |
| `mgmtIngress.enabled`              | Set to true to enable ingress record generation for the Management console                                                                  | `false`                  |
| `mgmtIngress.pathType`             | Ingress path type                                                                                                                           | `ImplementationSpecific` |
| `mgmtIngress.hostname`             | When the Management ingress is enabled, a host pointing to this will be created                                                             | `management.local`       |
| `mgmtIngress.annotations`          | Additional annotations for the Management Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `mgmtIngress.tls`                  | Enable TLS configuration for the hostname defined at `mgmtIngress.hostname` parameter                                                       | `false`                  |
| `mgmtIngress.extraHosts`           | The list of additional hostnames to be covered with this Management ingress record                                                          | `[]`                     |
| `mgmtIngress.extraPaths`           | An array with additional arbitrary paths that may need to be added to the ingress under the main host                                       | `[]`                     |
| `mgmtIngress.extraTls`             | TLS configuration for additional hostnames to be covered                                                                                    | `[]`                     |
| `mgmtIngress.secrets`              | TLS Secret configuration                                                                                                                    | `[]`                     |
| `mgmtIngress.ingressClassName`     | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                               | `""`                     |

### Persistence Parameters

| Name                                          | Description                                                                                                   | Value                   |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `persistence.enabled`                         | Enable persistence using Persistent Volume Claims                                                             | `true`                  |
| `persistence.storageClass`                    | Persistent Volume storage class                                                                               | `""`                    |
| `persistence.existingClaim`                   | Use a existing PVC which must be created manually before bound                                                | `""`                    |
| `persistence.accessModes`                     | Persistent Volume access modes                                                                                | `[]`                    |
| `persistence.size`                            | Persistent Volume size                                                                                        | `8Gi`                   |
| `persistence.annotations`                     | Persistent Volume Claim annotations                                                                           | `{}`                    |
| `volumePermissions.enabled`                   | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup`               | `false`                 |
| `volumePermissions.image.registry`            | Bitnami Shell image registry                                                                                  | `docker.io`             |
| `volumePermissions.image.repository`          | Bitnami Shell image repository                                                                                | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                 | Bitnami Shell image tag (immutable tags are recommended)                                                      | `11-debian-11-r118`     |
| `volumePermissions.image.digest`              | Bitnami Shell image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `volumePermissions.image.pullPolicy`          | Bitnami Shell image pull policy                                                                               | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`         | Bitnami Shell image pull secrets                                                                              | `[]`                    |
| `volumePermissions.resources.limits`          | The resources limits for the init container                                                                   | `{}`                    |
| `volumePermissions.resources.requests`        | The requested resources for the init container                                                                | `{}`                    |
| `volumePermissions.securityContext.runAsUser` | Set init container's Security Context runAsUser                                                               | `0`                     |

The above parameters map to the env variables defined in [bitnami/wildfly](https://github.com/bitnami/containers/tree/main/bitnami/wildfly). For more information please refer to the [bitnami/wildfly](https://github.com/bitnami/containers/tree/main/bitnami/wildfly) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set wildflyUser=manager,wildflyPassword=password \
    oci://registry-1.docker.io/bitnamicharts/wildfly
```

The above command sets the WildFly management username and password to `manager` and `password` respectively.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/wildfly
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling vs Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

## Persistence

The [Bitnami WildFly](https://github.com/bitnami/containers/tree/main/bitnami/wildfly) image stores the WildFly data and configurations at the `/bitnami/wildfly` path of the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Parameters](#parameters) section to configure the PVC or to disable persistence.

### Adjust permissions of persistent volume mountpoint

As the image run as non-root by default, it is necessary to adjust the ownership of the persistent volume so that the container can write data into it.

By default, the chart is configured to use Kubernetes Security Context to automatically change the ownership of the volume. However, this feature does not work in all Kubernetes distributions.
As an alternative, this chart supports using an initContainer to change the ownership of the volume before mounting it in the final destination.

You can enable this initContainer by setting `volumePermissions.enabled` to `true`.

### Add extra environment variables

To add extra environment variables (useful for advanced operations like custom init scripts),  use the `extraEnvVars` property.

```yaml
extraEnvVars:
  - name: LOG_LEVEL
    value: DEBUG
```

Alternatively, use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values.

### Use Sidecars and Init Containers

If additional containers are needed in the same pod (such as additional metrics or logging exporters), they can be defined using the `sidecars` config parameter. Similarly, extra init containers can be added using the `initContainers` parameter.

Refer to the chart documentation for more information on, and examples of, configuring and using [sidecars and init containers](https://docs.bitnami.com/kubernetes/infrastructure/wildfly/configuration/configure-sidecar-init-containers/).

### Set Pod affinity

This chart allows you to set custom Pod affinity using the `affinity` parameter. Find more information about Pod affinity in the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 10.0.0

Due to recent changes in the container image (see [Notable changes](https://github.com/bitnami/containers/tree/main/bitnami/apache#notable-changes)), the major version of the chart has been bumped preemptively.

Upgrading from version `9.x.x` should be possible without any extra required step, but it's highly recommended to backup your custom web apps data before upgrading.

### To 7.0.0

- Chart labels were adapted to follow the [Helm charts standard labels](https://helm.sh/docs/chart_best_practices/labels/#standard-labels).
- Ingress configuration was also adapted to follow the Helm charts best practices.
- This version also introduces `bitnami/common`, a [library chart](https://helm.sh/docs/topics/library_charts/#helm) as a dependency. More documentation about this new utility could be found [here](https://github.com/bitnami/charts/tree/main/bitnami/common#bitnami-common-library-chart). Please, make sure that you have updated the chart dependencies before executing any upgrade.

Consequences:

- Backwards compatibility is not guaranteed. However, you can easily workaround this issue by removing Wildfly deployment before upgrading (the following example assumes that the release name is `wildfly`):

```console
export WILDFLY_PASSWORD=$(kubectl get secret --namespace default wildfly -o jsonpath="{.data.wildfly-password}" | base64 -d)
kubectl delete deployments.apps wildfly
helm upgrade wildfly oci://registry-1.docker.io/bitnamicharts/wildfly --set wildflyPassword=$WILDFLY_PASSWORD
```

### To 6.0.0

[On November 13, 2020, Helm v2 support formally ended](https://github.com/helm/charts#status-of-the-project). This major version is the result of the required changes applied to the Helm Chart to be able to incorporate the different features added in Helm v3 and to be consistent with the Helm project itself regarding the Helm v2 EOL.

[Learn more about this change and related upgrade considerations](https://docs.bitnami.com/kubernetes/infrastructure/wildfly/administration/upgrade-helm3/).

### To 2.1.0

WildFly container was moved to a non-root approach. There shouldn't be any issue when upgrading since the corresponding `securityContext` is enabled by default. Both the container image and the chart can be upgraded by running the command below:

```console
helm upgrade my-release oci://registry-1.docker.io/bitnamicharts/wildfly
```

If you use a previous container image (previous to **14.0.1-r75**) disable the `securityContext` by running the command below:

```console
helm upgrade my-release oci://registry-1.docker.io/bitnamicharts/wildfly --set securityContext.enabled=false,image.tag=XXX
```

### To 1.0.0

Backwards compatibility is not guaranteed unless you modify the labels used on the chart's deployments.
Use the workaround below to upgrade from versions previous to 1.0.0. The following example assumes that the release name is wildfly:

```console
kubectl patch deployment wildfly --type=json -p='[{"op": "remove", "path": "/spec/selector/matchLabels/chart"}]'
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