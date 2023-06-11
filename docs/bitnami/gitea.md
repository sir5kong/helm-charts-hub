<!--- app-name: Gitea -->

# Gitea packaged by Bitnami

Gitea is a lightweight code hosting solution. Written in Go, features low resource consumption, easy upgrades and multiple databases.

[Overview of Gitea](https://gitea.io/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/gitea
```

## Introduction

This chart bootstraps a [Gitea](https://github.com/bitnami/containers/tree/main/bitnami/gitea) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages the [Bitnami PostgreSQL chart](https://github.com/bitnami/charts/tree/main/bitnami/postgresql) which is required for bootstrapping a PostgreSQL deployment as a database for the Gitea application.

Bitnami charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/gitea
```

The command deploys Gitea on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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
| `nameOverride`      | String to partially override gitea.fullname template (will maintain the release name)                     | `""`  |
| `fullnameOverride`  | String to fully override gitea.fullname template                                                          | `""`  |
| `namespaceOverride` | String to fully override common.names.namespace                                                           | `""`  |
| `commonAnnotations` | Common annotations to add to all Gitea resources (sub-charts are not considered). Evaluated as a template | `{}`  |
| `commonLabels`      | Common labels to add to all Gitea resources (sub-charts are not considered). Evaluated as a template      | `{}`  |
| `extraDeploy`       | Array of extra objects to deploy with the release (evaluated as a template).                              | `[]`  |

### Gitea parameters

| Name                                    | Description                                                                                                           | Value                 |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `image.registry`                        | Gitea image registry                                                                                                  | `docker.io`           |
| `image.repository`                      | Gitea Image name                                                                                                      | `bitnami/gitea`       |
| `image.tag`                             | Gitea Image tag                                                                                                       | `1.19.3-debian-11-r6` |
| `image.digest`                          | Gitea image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                 | `""`                  |
| `image.pullPolicy`                      | Gitea image pull policy                                                                                               | `IfNotPresent`        |
| `image.pullSecrets`                     | Specify docker-registry secret names as an array                                                                      | `[]`                  |
| `image.debug`                           | Specify if debug logs should be enabled                                                                               | `false`               |
| `replicaCount`                          | Number of Gitea Pods to run (requires ReadWriteMany PVC support)                                                      | `1`                   |
| `adminUsername`                         | User of the application                                                                                               | `bn_user`             |
| `adminPassword`                         | Application password                                                                                                  | `""`                  |
| `adminEmail`                            | Admin email                                                                                                           | `user@example.com`    |
| `appName`                               | Gitea application name                                                                                                | `example`             |
| `runMode`                               | Gitea application host                                                                                                | `prod`                |
| `exposeSSH`                             | Make the SSH server accesible                                                                                         | `true`                |
| `rootURL`                               | UI Root URL (for link generation)                                                                                     | `""`                  |
| `command`                               | Override default container command (useful when using custom images)                                                  | `[]`                  |
| `args`                                  | Override default container args (useful when using custom images)                                                     | `[]`                  |
| `updateStrategy.type`                   | Update strategy - only really applicable for deployments with RWO PVs attached                                        | `RollingUpdate`       |
| `priorityClassName`                     | Gitea pods' priorityClassName                                                                                         | `""`                  |
| `schedulerName`                         | Name of the k8s scheduler (other than default)                                                                        | `""`                  |
| `topologySpreadConstraints`             | Topology Spread Constraints for pod assignment                                                                        | `[]`                  |
| `hostAliases`                           | Add deployment host aliases                                                                                           | `[]`                  |
| `extraEnvVars`                          | Extra environment variables                                                                                           | `[]`                  |
| `extraEnvVarsCM`                        | ConfigMap containing extra env vars                                                                                   | `""`                  |
| `extraEnvVarsSecret`                    | Secret containing extra env vars (in case of sensitive data)                                                          | `""`                  |
| `extraVolumes`                          | Array of extra volumes to be added to the deployment (evaluated as template). Requires setting `extraVolumeMounts`    | `[]`                  |
| `extraVolumeMounts`                     | Array of extra volume mounts to be added to the container (evaluated as template). Normally used with `extraVolumes`. | `[]`                  |
| `initContainers`                        | Add additional init containers to the pod (evaluated as a template)                                                   | `[]`                  |
| `sidecars`                              | Attach additional containers to the pod (evaluated as a template)                                                     | `[]`                  |
| `tolerations`                           | Tolerations for pod assignment                                                                                        | `[]`                  |
| `existingSecret`                        | Name of a secret with the application password                                                                        | `""`                  |
| `existingSecretKey`                     | Key inside the existing secret containing the password                                                                | `admin-password`      |
| `smtpHost`                              | SMTP host                                                                                                             | `""`                  |
| `smtpPort`                              | SMTP port                                                                                                             | `""`                  |
| `smtpUser`                              | SMTP user                                                                                                             | `""`                  |
| `smtpPassword`                          | SMTP password                                                                                                         | `""`                  |
| `smtpExistingSecret`                    | The name of an existing secret with SMTP credentials                                                                  | `""`                  |
| `containerPorts`                        | Container ports                                                                                                       | `{}`                  |
| `persistence.enabled`                   | Enable persistence using PVC                                                                                          | `true`                |
| `persistence.storageClass`              | PVC Storage Class for Gitea volume                                                                                    | `""`                  |
| `persistence.accessModes`               | PVC Access Mode for Gitea volume                                                                                      | `["ReadWriteOnce"]`   |
| `persistence.size`                      | PVC Storage Request for Gitea volume                                                                                  | `8Gi`                 |
| `persistence.dataSource`                | Custom PVC data source                                                                                                | `{}`                  |
| `persistence.existingClaim`             | A manually managed Persistent Volume Claim                                                                            | `""`                  |
| `persistence.hostPath`                  | If defined, the gitea-data volume will mount to the specified hostPath.                                               | `""`                  |
| `persistence.annotations`               | Persistent Volume Claim annotations                                                                                   | `{}`                  |
| `persistence.selector`                  | Selector to match an existing Persistent Volume for Gitea data PVC                                                    | `{}`                  |
| `podAffinityPreset`                     | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                   | `""`                  |
| `podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                              | `soft`                |
| `nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                             | `""`                  |
| `nodeAffinityPreset.key`                | Node label key to match Ignored if `affinity` is set.                                                                 | `""`                  |
| `nodeAffinityPreset.values`             | Node label values to match. Ignored if `affinity` is set.                                                             | `[]`                  |
| `affinity`                              | Affinity for pod assignment                                                                                           | `{}`                  |
| `nodeSelector`                          | Node labels for pod assignment. Evaluated as a template.                                                              | `{}`                  |
| `resources.requests`                    | The requested resources for the init container                                                                        | `{}`                  |
| `resources.limits`                      | The resources limits for the init container                                                                           | `{}`                  |
| `podSecurityContext.enabled`            | Enable Gitea pods' Security Context                                                                                   | `true`                |
| `podSecurityContext.fsGroup`            | Gitea pods' group ID                                                                                                  | `1001`                |
| `containerSecurityContext.enabled`      | Enable Gitea containers' Security Context                                                                             | `true`                |
| `containerSecurityContext.runAsUser`    | Gitea containers' Security Context                                                                                    | `1001`                |
| `containerSecurityContext.runAsNonRoot` | Set Controller container's Security Context runAsNonRoot                                                              | `true`                |
| `startupProbe.enabled`                  | Enable startupProbe                                                                                                   | `false`               |
| `startupProbe.path`                     | Request path for startupProbe                                                                                         | `/`                   |
| `startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                                | `600`                 |
| `startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                       | `10`                  |
| `startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                      | `5`                   |
| `startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                                    | `5`                   |
| `startupProbe.successThreshold`         | Success threshold for startupProbe                                                                                    | `1`                   |
| `livenessProbe.enabled`                 | Enable livenessProbe                                                                                                  | `true`                |
| `livenessProbe.path`                    | Request path for livenessProbe                                                                                        | `/`                   |
| `livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                               | `600`                 |
| `livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                      | `10`                  |
| `livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                                     | `5`                   |
| `livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                                   | `5`                   |
| `livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                                   | `1`                   |
| `readinessProbe.enabled`                | Enable readinessProbe                                                                                                 | `true`                |
| `readinessProbe.path`                   | Request path for readinessProbe                                                                                       | `/`                   |
| `readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                              | `30`                  |
| `readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                                     | `5`                   |
| `readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                                    | `1`                   |
| `readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                                  | `5`                   |
| `readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                                  | `1`                   |
| `customStartupProbe`                    | Override default startup probe                                                                                        | `{}`                  |
| `customLivenessProbe`                   | Override default liveness probe                                                                                       | `{}`                  |
| `customReadinessProbe`                  | Override default readiness probe                                                                                      | `{}`                  |
| `lifecycleHooks`                        | LifecycleHook to set additional configuration at startup Evaluated as a template                                      | `{}`                  |
| `podAnnotations`                        | Pod annotations                                                                                                       | `{}`                  |
| `podLabels`                             | Add additional labels to the pod (evaluated as a template)                                                            | `{}`                  |

### Traffic Exposure Parameters

| Name                               | Description                                                                                                                      | Value                    |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.type`                     | Kubernetes Service type                                                                                                          | `LoadBalancer`           |
| `service.ports.http`               | Service HTTP port                                                                                                                | `80`                     |
| `service.ports.ssh`                | Service SSH port                                                                                                                 | `22`                     |
| `service.loadBalancerSourceRanges` | Restricts access for LoadBalancer (only with `service.type: LoadBalancer`)                                                       | `[]`                     |
| `service.loadBalancerIP`           | loadBalancerIP for the Gitea Service (optional, cloud specific)                                                                  | `""`                     |
| `service.nodePorts`                | Kubernetes node port                                                                                                             | `{}`                     |
| `service.externalTrafficPolicy`    | Enable client source IP preservation                                                                                             | `Cluster`                |
| `service.clusterIP`                | Gitea service Cluster IP                                                                                                         | `""`                     |
| `service.extraPorts`               | Extra ports to expose (normally used with the `sidecar` value)                                                                   | `[]`                     |
| `service.annotations`              | Additional custom annotations for Gitea service                                                                                  | `{}`                     |
| `service.sessionAffinity`          | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                             | `None`                   |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `ingress.enabled`                  | Enable ingress controller resource                                                                                               | `false`                  |
| `ingress.pathType`                 | Ingress Path type                                                                                                                | `ImplementationSpecific` |
| `ingress.apiVersion`               | Override API Version (automatically detected if not set)                                                                         | `""`                     |
| `ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `ingress.hostname`                 | Default host for the ingress resource                                                                                            | `gitea.local`            |
| `ingress.path`                     | The Path to Gitea. You may need to set this to '/*' in order to use this                                                         | `/`                      |
| `ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.tls`                      | Enable TLS configuration for the hostname defined at ingress.hostname parameter                                                  | `false`                  |
| `ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `ingress.extraHosts`               | The list of additional hostnames to be covered with this ingress record.                                                         | `[]`                     |
| `ingress.extraPaths`               | Any additional arbitrary paths that may need to be added to the ingress under the main host.                                     | `[]`                     |
| `ingress.extraTls`                 | The tls configuration for additional hostnames to be covered with this ingress record.                                           | `[]`                     |
| `ingress.secrets`                  | If you're providing your own certificates, please use this to add the certificates as secrets                                    | `[]`                     |
| `ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### Other Parameters

| Name                                          | Description                                                            | Value  |
| --------------------------------------------- | ---------------------------------------------------------------------- | ------ |
| `serviceAccount.create`                       | Enable creation of ServiceAccount for Gitea pod                        | `true` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                                 | `""`   |
| `serviceAccount.automountServiceAccountToken` | Allows auto mount of ServiceAccountToken on the serviceAccount created | `true` |
| `serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                   | `{}`   |

### Database parameters

| Name                                         | Description                                                             | Value           |
| -------------------------------------------- | ----------------------------------------------------------------------- | --------------- |
| `postgresql.enabled`                         | Switch to enable or disable the PostgreSQL helm chart                   | `true`          |
| `postgresql.auth.username`                   | Name for a custom user to create                                        | `bn_gitea`      |
| `postgresql.auth.password`                   | Password for the custom user to create                                  | `""`            |
| `postgresql.auth.database`                   | Name for a custom database to create                                    | `bitnami_gitea` |
| `postgresql.auth.existingSecret`             | Name of existing secret to use for PostgreSQL credentials               | `""`            |
| `postgresql.architecture`                    | PostgreSQL architecture (`standalone` or `replication`)                 | `standalone`    |
| `postgresql.service.ports.postgresql`        | PostgreSQL service port                                                 | `5432`          |
| `externalDatabase.host`                      | Database host                                                           | `""`            |
| `externalDatabase.port`                      | Database port number                                                    | `5432`          |
| `externalDatabase.user`                      | Non-root username for JupyterHub                                        | `postgres`      |
| `externalDatabase.password`                  | Password for the non-root username for JupyterHub                       | `""`            |
| `externalDatabase.database`                  | JupyterHub database name                                                | `gitea`         |
| `externalDatabase.existingSecret`            | Name of an existing secret resource containing the database credentials | `""`            |
| `externalDatabase.existingSecretPasswordKey` | Name of an existing secret key containing the database credentials      | `db-password`   |

### Volume Permissions parameters

| Name                                   | Description                                                                                                                                               | Value                   |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`            | Enable init container that changes volume permissions in the data directory (for cases where the default k8s `runAsUser` and `fsUser` values do not work) | `false`                 |
| `volumePermissions.image.registry`     | Init container volume-permissions image registry                                                                                                          | `docker.io`             |
| `volumePermissions.image.repository`   | Init container volume-permissions image name                                                                                                              | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`          | Init container volume-permissions image tag                                                                                                               | `11-debian-11-r118`     |
| `volumePermissions.image.digest`       | Init container volume-permissions image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                         | `""`                    |
| `volumePermissions.image.pullPolicy`   | Init container volume-permissions image pull policy                                                                                                       | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`  | Specify docker-registry secret names as an array                                                                                                          | `[]`                    |
| `volumePermissions.resources.limits`   | The resources limits for the container                                                                                                                    | `{}`                    |
| `volumePermissions.resources.requests` | The requested resources for the container                                                                                                                 | `{}`                    |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set adminUsername=user,giteaPassword=password,postgresql.auth.rootPassword=secretpassword \
    oci://registry-1.docker.io/bitnamicharts/gitea
```

The above command sets the Gitea administrator account username and password to `user` and `password` respectively. Additionally, it sets the PostgreSQL `root` user password to `secretpassword`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/gitea
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

The [Bitnami Gitea](https://github.com/bitnami/containers/tree/main/bitnami/gitea) image stores the Gitea data and configurations at the `/bitnami/gitea` path of the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Parameters](#parameters) section to configure the PVC or to disable persistence.

### Existing PersistentVolumeClaim

1. Create the PersistentVolume
2. Create the PersistentVolumeClaim
3. Install the chart

```console
helm install my-release --set persistence.existingClaim=PVC_NAME oci://registry-1.docker.io/bitnamicharts/gitea
```

### Host path

#### System compatibility

- The local filesystem accessibility to a container in a pod with `hostPath` has been tested on OSX/MacOS with xhyve, and Linux with VirtualBox.
- Windows has not been tested with the supported VM drivers. Minikube does however officially support [Mounting Host Folders](https://minikube.sigs.k8s.io/docs/handbook/mount/) per pod. Or you may manually sync your container whenever host files are changed with tools like [docker-sync](https://github.com/EugenMayer/docker-sync) or [docker-bg-sync](https://github.com/cweagans/docker-bg-sync).

#### Mounting steps

1. The specified `hostPath` directory must already exist (create one if it does not).
2. Install the chart

    ```console
    helm install my-release --set persistence.hostPath=/PATH/TO/HOST/MOUNT oci://registry-1.docker.io/bitnamicharts/gitea
    ```

    This will mount the `gitea-data` volume into the `hostPath` directory. The site data will be persisted if the mount path contains valid data, else the site data will be initialized at first launch.
3. Because the container cannot control the host machine's directory permissions, you must set the Gitea file directory permissions yourself

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

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