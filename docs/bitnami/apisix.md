<!--- app-name: Apache APISIX -->

# Apache APISIX packaged by Bitnami

Apache APISIX is high-performance, real-time API Gateway. Features load balancing, dynamic upstream, canary release, circuit breaking, authentication, observability, amongst others.

[Overview of Apache APISIX](https://apisix.apache.org/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/apisix
```

## Introduction

This chart bootstraps a [Apache APISIX](https://github.com/bitnami/containers/tree/main/bitnami/apisix) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release my-repo/apisix
```

The command deploys apisix on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

| Name                     | Description                                                                                                                                       | Value                |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- |
| `kubeVersion`            | Override Kubernetes version                                                                                                                       | `""`                 |
| `nameOverride`           | String to partially override common.names.name                                                                                                    | `""`                 |
| `fullnameOverride`       | String to fully override common.names.fullname                                                                                                    | `""`                 |
| `namespaceOverride`      | String to fully override common.names.namespace                                                                                                   | `""`                 |
| `commonLabels`           | Labels to add to all deployed objects                                                                                                             | `{}`                 |
| `commonAnnotations`      | Annotations to add to all deployed objects                                                                                                        | `{}`                 |
| `clusterDomain`          | Kubernetes cluster domain name                                                                                                                    | `cluster.local`      |
| `extraDeploy`            | Array of extra objects to deploy with the release                                                                                                 | `[]`                 |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)                                                           | `false`              |
| `diagnosticMode.command` | Command to override all containers in the deployment                                                                                              | `["sleep"]`          |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                                                                                 | `["infinity"]`       |
| `image.registry`         | APISIX image registry                                                                                                                             | `docker.io`          |
| `image.repository`       | APISIX image repository                                                                                                                           | `bitnami/apisix`     |
| `image.tag`              | APISIX image tag (immutable tags are recommended)                                                                                                 | `3.3.0-debian-11-r7` |
| `image.digest`           | APISIX image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                 |
| `image.pullPolicy`       | APISIX image pull policy                                                                                                                          | `IfNotPresent`       |
| `image.pullSecrets`      | APISIX image pull secrets                                                                                                                         | `[]`                 |
| `image.debug`            | Enable APISIX image debug mode                                                                                                                    | `false`              |

### APISIX Data Plane parameters

| Name                                                          | Description                                                                                                              | Value            |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ---------------- |
| `dataPlane.enabled`                                           | Enable APISIX                                                                                                            | `true`           |
| `dataPlane.useDaemonSet`                                      | Deploy as DaemonSet                                                                                                      | `false`          |
| `dataPlane.replicaCount`                                      | Number of APISIX replicas to deploy                                                                                      | `1`              |
| `dataPlane.hostNetwork`                                       | Use hostNetwork                                                                                                          | `false`          |
| `dataPlane.containerPorts.http`                               | APISIX HTTP container port                                                                                               | `9080`           |
| `dataPlane.containerPorts.https`                              | APISIX HTTPS container port                                                                                              | `9443`           |
| `dataPlane.containerPorts.control`                            | APISIX control container port                                                                                            | `9090`           |
| `dataPlane.containerPorts.metrics`                            | APISIX metrics container port                                                                                            | `9099`           |
| `dataPlane.livenessProbe.enabled`                             | Enable livenessProbe on APISIX containers                                                                                | `false`          |
| `dataPlane.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                  | `5`              |
| `dataPlane.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                         | `10`             |
| `dataPlane.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                        | `5`              |
| `dataPlane.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                      | `5`              |
| `dataPlane.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                      | `1`              |
| `dataPlane.readinessProbe.enabled`                            | Enable readinessProbe on APISIX containers                                                                               | `true`           |
| `dataPlane.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                 | `5`              |
| `dataPlane.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                        | `10`             |
| `dataPlane.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                       | `5`              |
| `dataPlane.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                     | `5`              |
| `dataPlane.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                     | `1`              |
| `dataPlane.startupProbe.enabled`                              | Enable startupProbe on APISIX containers                                                                                 | `false`          |
| `dataPlane.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                                                   | `5`              |
| `dataPlane.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                                                          | `10`             |
| `dataPlane.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                                                         | `5`              |
| `dataPlane.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                                                       | `5`              |
| `dataPlane.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                                                       | `1`              |
| `dataPlane.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                      | `{}`             |
| `dataPlane.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                     | `{}`             |
| `dataPlane.customStartupProbe`                                | Custom startupProbe that overrides the default one                                                                       | `{}`             |
| `dataPlane.resources.limits`                                  | The resources limits for the APISIX containers                                                                           | `{}`             |
| `dataPlane.resources.requests`                                | The requested resources for the APISIX containers                                                                        | `{}`             |
| `dataPlane.podSecurityContext.enabled`                        | Enabled APISIX pods' Security Context                                                                                    | `true`           |
| `dataPlane.podSecurityContext.fsGroup`                        | Set APISIX pod's Security Context fsGroup                                                                                | `1001`           |
| `dataPlane.podSecurityContext.seccompProfile.type`            | Set APISIX container's Security Context seccomp profile                                                                  | `RuntimeDefault` |
| `dataPlane.containerSecurityContext.enabled`                  | Enabled APISIX containers' Security Context                                                                              | `true`           |
| `dataPlane.containerSecurityContext.runAsUser`                | Set APISIX containers' Security Context runAsUser                                                                        | `1001`           |
| `dataPlane.containerSecurityContext.runAsNonRoot`             | Set APISIX containers' Security Context runAsNonRoot                                                                     | `true`           |
| `dataPlane.containerSecurityContext.readOnlyRootFilesystem`   | Set APISIX containers' Security Context runAsNonRoot                                                                     | `true`           |
| `dataPlane.containerSecurityContext.allowPrivilegeEscalation` | Set APISIX container's privilege escalation                                                                              | `false`          |
| `dataPlane.containerSecurityContext.capabilities.drop`        | Set APISIX container's Security Context runAsNonRoot                                                                     | `["ALL"]`        |
| `dataPlane.command`                                           | Override default container command (useful when using custom images)                                                     | `[]`             |
| `dataPlane.args`                                              | Override default container args (useful when using custom images)                                                        | `[]`             |
| `dataPlane.hostAliases`                                       | APISIX pods host aliases                                                                                                 | `[]`             |
| `dataPlane.defaultConfig`                                     | Apisix apisix configuration (evaluated as a template)                                                                    | `""`             |
| `dataPlane.extraConfig`                                       | extra configuration parameters to add to the config.yaml file in APISIX Data plane                                       | `{}`             |
| `dataPlane.existingConfigMap`                                 | name of a ConfigMap with existing configuration for the apisix                                                           | `""`             |
| `dataPlane.extraConfigExistingConfigMap`                      | name of a ConfigMap with existing configuration for the data plane                                                       | `""`             |
| `dataPlane.tls.enabled`                                       | Enable TLS transport in Data Plane                                                                                       | `true`           |
| `dataPlane.tls.autoGenerated`                                 | Auto-generate self-signed certificates                                                                                   | `true`           |
| `dataPlane.tls.existingSecret`                                | Name of a secret containing the certificates                                                                             | `""`             |
| `dataPlane.tls.certFilename`                                  | Path of the certificate file when mounted as a secret                                                                    | `tls.crt`        |
| `dataPlane.tls.certKeyFilename`                               | Path of the certificate key file when mounted as a secret                                                                | `tls.key`        |
| `dataPlane.tls.certCAFilename`                                | Path of the certificate CA file when mounted as a secret                                                                 | `ca.crt`         |
| `dataPlane.tls.cert`                                          | Content of the certificate to be added to the secret                                                                     | `""`             |
| `dataPlane.tls.key`                                           | Content of the certificate key to be added to the secret                                                                 | `""`             |
| `dataPlane.tls.ca`                                            | Content of the certificate CA to be added to the secret                                                                  | `""`             |
| `dataPlane.podLabels`                                         | Extra labels for APISIX pods                                                                                             | `{}`             |
| `dataPlane.podAnnotations`                                    | Annotations for APISIX pods                                                                                              | `{}`             |
| `dataPlane.podAffinityPreset`                                 | Pod affinity preset. Ignored if `apisix.affinity` is set. Allowed values: `soft` or `hard`                               | `""`             |
| `dataPlane.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `apisix.affinity` is set. Allowed values: `soft` or `hard`                          | `soft`           |
| `dataPlane.pdb.create`                                        | Enable/disable a Pod Disruption Budget creation                                                                          | `false`          |
| `dataPlane.pdb.minAvailable`                                  | Minimum number/percentage of pods that should remain scheduled                                                           | `1`              |
| `dataPlane.pdb.maxUnavailable`                                | Maximum number/percentage of pods that may be made unavailable                                                           | `""`             |
| `dataPlane.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `apisix.affinity` is set. Allowed values: `soft` or `hard`                         | `""`             |
| `dataPlane.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `apisix.affinity` is set                                                             | `""`             |
| `dataPlane.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `apisix.affinity` is set                                                          | `[]`             |
| `dataPlane.affinity`                                          | Affinity for APISIX pods assignment                                                                                      | `{}`             |
| `dataPlane.nodeSelector`                                      | Node labels for APISIX pods assignment                                                                                   | `{}`             |
| `dataPlane.tolerations`                                       | Tolerations for APISIX pods assignment                                                                                   | `[]`             |
| `dataPlane.updateStrategy.type`                               | APISIX statefulset strategy type                                                                                         | `RollingUpdate`  |
| `dataPlane.priorityClassName`                                 | APISIX pods' priorityClassName                                                                                           | `""`             |
| `dataPlane.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `[]`             |
| `dataPlane.schedulerName`                                     | Name of the k8s scheduler (other than default) for APISIX pods                                                           | `""`             |
| `dataPlane.terminationGracePeriodSeconds`                     | Seconds Redmine pod needs to terminate gracefully                                                                        | `""`             |
| `dataPlane.lifecycleHooks`                                    | for the APISIX container(s) to automate configuration before or after startup                                            | `{}`             |
| `dataPlane.extraEnvVars`                                      | Array with extra environment variables to add to APISIX nodes                                                            | `[]`             |
| `dataPlane.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars for APISIX nodes                                                    | `""`             |
| `dataPlane.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars for APISIX nodes                                                       | `""`             |
| `dataPlane.extraVolumes`                                      | Optionally specify extra list of additional volumes for the APISIX pod(s)                                                | `[]`             |
| `dataPlane.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for the APISIX container(s)                                     | `[]`             |
| `dataPlane.sidecars`                                          | Add additional sidecar containers to the APISIX pod(s)                                                                   | `[]`             |
| `dataPlane.initContainers`                                    | Add additional init containers to the APISIX pod(s)                                                                      | `[]`             |

### APISIX Data Plane Traffic Exposure Parameters

| Name                                         | Description                                                                                                                      | Value                     |
| -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `dataPlane.service.type`                     | APISIX service type                                                                                                              | `LoadBalancer`            |
| `dataPlane.service.ports.http`               | APISIX service HTTP port                                                                                                         | `80`                      |
| `dataPlane.service.ports.https`              | APISIX service HTTPS port                                                                                                        | `443`                     |
| `dataPlane.service.ports.metrics`            | APISIX service HTTPS port                                                                                                        | `8080`                    |
| `dataPlane.service.nodePorts.http`           | Node port for HTTP                                                                                                               | `""`                      |
| `dataPlane.service.nodePorts.https`          | Node port for HTTPS                                                                                                              | `""`                      |
| `dataPlane.service.nodePorts.metrics`        | Node port for metrics                                                                                                            | `""`                      |
| `dataPlane.service.clusterIP`                | APISIX service Cluster IP                                                                                                        | `""`                      |
| `dataPlane.service.loadBalancerIP`           | APISIX service Load Balancer IP                                                                                                  | `""`                      |
| `dataPlane.service.loadBalancerSourceRanges` | APISIX service Load Balancer sources                                                                                             | `[]`                      |
| `dataPlane.service.externalTrafficPolicy`    | APISIX service external traffic policy                                                                                           | `Cluster`                 |
| `dataPlane.service.annotations`              | Additional custom annotations for APISIX service                                                                                 | `{}`                      |
| `dataPlane.service.extraPorts`               | Extra ports to expose in APISIX service (normally used with the `sidecars` value)                                                | `[]`                      |
| `dataPlane.service.sessionAffinity`          | Control where web requests go, to the same pod or round-robin                                                                    | `None`                    |
| `dataPlane.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                      |
| `dataPlane.ingress.enabled`                  | Enable ingress record generation for Apisix                                                                                      | `false`                   |
| `dataPlane.ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific`  |
| `dataPlane.ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                      |
| `dataPlane.ingress.hostname`                 | Default host for the ingress record                                                                                              | `apisix-data-plane.local` |
| `dataPlane.ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                      |
| `dataPlane.ingress.path`                     | Default path for the ingress record                                                                                              | `/`                       |
| `dataPlane.ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                      |
| `dataPlane.ingress.tls`                      | Enable TLS configuration for the host defined at `dataPlane.ingress.hostname` parameter                                          | `false`                   |
| `dataPlane.ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                   |
| `dataPlane.ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                      |
| `dataPlane.ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                      |
| `dataPlane.ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                      |
| `dataPlane.ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                      |
| `dataPlane.ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                      |

### APISIX Data Plane Autoscaling configuration

| Name                                                | Description                                                                                                                                                            | Value   |
| --------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `dataPlane.autoscaling.vpa.enabled`                 | Enable VPA                                                                                                                                                             | `false` |
| `dataPlane.autoscaling.vpa.annotations`             | Annotations for VPA resource                                                                                                                                           | `{}`    |
| `dataPlane.autoscaling.vpa.controlledResources`     | VPA List of resources that the vertical pod autoscaler can control. Defaults to cpu and memory                                                                         | `[]`    |
| `dataPlane.autoscaling.vpa.maxAllowed`              | VPA Max allowed resources for the pod                                                                                                                                  | `{}`    |
| `dataPlane.autoscaling.vpa.minAllowed`              | VPA Min allowed resources for the pod                                                                                                                                  | `{}`    |
| `dataPlane.autoscaling.vpa.updatePolicy.updateMode` | Autoscaling update policy Specifies whether recommended updates are applied when a Pod is started and whether recommended updates are applied during the life of a Pod | `Auto`  |
| `dataPlane.autoscaling.hpa.enabled`                 | Enable HPA for APISIX Data Plane                                                                                                                                       | `false` |
| `dataPlane.autoscaling.hpa.minReplicas`             | Minimum number of APISIX Data Plane replicas                                                                                                                           | `""`    |
| `dataPlane.autoscaling.hpa.maxReplicas`             | Maximum number of APISIX Data Plane replicas                                                                                                                           | `""`    |
| `dataPlane.autoscaling.hpa.targetCPU`               | Target CPU utilization percentage                                                                                                                                      | `""`    |
| `dataPlane.autoscaling.hpa.targetMemory`            | Target Memory utilization percentage                                                                                                                                   | `""`    |

### APISIX Data Plane RBAC Parameters

| Name                                                    | Description                                                      | Value  |
| ------------------------------------------------------- | ---------------------------------------------------------------- | ------ |
| `dataPlane.rbac.create`                                 | Specifies whether RBAC resources should be created               | `true` |
| `dataPlane.rbac.rules`                                  | Custom RBAC rules to set                                         | `[]`   |
| `dataPlane.serviceAccount.create`                       | Specifies whether a ServiceAccount should be created             | `true` |
| `dataPlane.serviceAccount.name`                         | The name of the ServiceAccount to use.                           | `""`   |
| `dataPlane.serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template) | `{}`   |
| `dataPlane.serviceAccount.automountServiceAccountToken` | Automount service account token for the apisix service account   | `true` |

### APISIX Data Plane Metrics Parameters

| Name                                                 | Description                                                                                            | Value   |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------- |
| `dataPlane.metrics.enabled`                          | Enable the export of Prometheus metrics                                                                | `false` |
| `dataPlane.metrics.annotations`                      | Annotations for the apisix service in order to scrape metrics                                          | `{}`    |
| `dataPlane.metrics.serviceMonitor.enabled`           | if `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`) | `false` |
| `dataPlane.metrics.serviceMonitor.namespace`         | Namespace in which Prometheus is running                                                               | `""`    |
| `dataPlane.metrics.serviceMonitor.annotations`       | Additional custom annotations for the ServiceMonitor                                                   | `{}`    |
| `dataPlane.metrics.serviceMonitor.labels`            | Extra labels for the ServiceMonitor                                                                    | `{}`    |
| `dataPlane.metrics.serviceMonitor.jobLabel`          | The name of the label on the target service to use as the job name in Prometheus                       | `""`    |
| `dataPlane.metrics.serviceMonitor.honorLabels`       | honorLabels chooses the metric's labels on collisions with target labels                               | `false` |
| `dataPlane.metrics.serviceMonitor.interval`          | Interval at which metrics should be scraped.                                                           | `""`    |
| `dataPlane.metrics.serviceMonitor.scrapeTimeout`     | Timeout after which the scrape is ended                                                                | `""`    |
| `dataPlane.metrics.serviceMonitor.metricRelabelings` | Specify additional relabeling of metrics                                                               | `[]`    |
| `dataPlane.metrics.serviceMonitor.relabelings`       | Specify general relabeling                                                                             | `[]`    |
| `dataPlane.metrics.serviceMonitor.selector`          | Prometheus instance selector labels                                                                    | `{}`    |

### APISIX Control Plane Parameters

| Name                                                             | Description                                                                                                              | Value            |
| ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ---------------- |
| `controlPlane.enabled`                                           | Enable APISIX                                                                                                            | `true`           |
| `controlPlane.replicaCount`                                      | Number of APISIX replicas to deploy                                                                                      | `1`              |
| `controlPlane.hostNetwork`                                       | Use hostNetwork                                                                                                          | `false`          |
| `controlPlane.useDaemonSet`                                      | Deploy as DaemonSet                                                                                                      | `false`          |
| `controlPlane.containerPorts.adminAPI`                           | APISIX Admin API port                                                                                                    | `9180`           |
| `controlPlane.containerPorts.configServer`                       | APISIX config port                                                                                                       | `9280`           |
| `controlPlane.containerPorts.control`                            | APISIX control port                                                                                                      | `9090`           |
| `controlPlane.containerPorts.metrics`                            | APISIX metrics port                                                                                                      | `9099`           |
| `controlPlane.livenessProbe.enabled`                             | Enable livenessProbe on APISIX containers                                                                                | `false`          |
| `controlPlane.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                  | `5`              |
| `controlPlane.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                         | `10`             |
| `controlPlane.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                        | `5`              |
| `controlPlane.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                      | `5`              |
| `controlPlane.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                      | `1`              |
| `controlPlane.readinessProbe.enabled`                            | Enable readinessProbe on APISIX containers                                                                               | `true`           |
| `controlPlane.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                 | `5`              |
| `controlPlane.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                        | `10`             |
| `controlPlane.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                       | `5`              |
| `controlPlane.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                     | `5`              |
| `controlPlane.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                     | `1`              |
| `controlPlane.startupProbe.enabled`                              | Enable startupProbe on APISIX containers                                                                                 | `false`          |
| `controlPlane.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                                                   | `5`              |
| `controlPlane.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                                                          | `10`             |
| `controlPlane.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                                                         | `5`              |
| `controlPlane.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                                                       | `5`              |
| `controlPlane.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                                                       | `1`              |
| `controlPlane.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                      | `{}`             |
| `controlPlane.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                     | `{}`             |
| `controlPlane.customStartupProbe`                                | Custom startupProbe that overrides the default one                                                                       | `{}`             |
| `controlPlane.resources.limits`                                  | The resources limits for the APISIX containers                                                                           | `{}`             |
| `controlPlane.resources.requests`                                | The requested resources for the APISIX containers                                                                        | `{}`             |
| `controlPlane.podSecurityContext.enabled`                        | Enabled APISIX pods' Security Context                                                                                    | `true`           |
| `controlPlane.podSecurityContext.fsGroup`                        | Set APISIX pod's Security Context fsGroup                                                                                | `1001`           |
| `controlPlane.podSecurityContext.seccompProfile.type`            | Set APISIX container's Security Context seccomp profile                                                                  | `RuntimeDefault` |
| `controlPlane.containerSecurityContext.enabled`                  | Enabled APISIX containers' Security Context                                                                              | `true`           |
| `controlPlane.containerSecurityContext.runAsUser`                | Set APISIX containers' Security Context runAsUser                                                                        | `1001`           |
| `controlPlane.containerSecurityContext.runAsNonRoot`             | Set APISIX containers' Security Context runAsNonRoot                                                                     | `true`           |
| `controlPlane.containerSecurityContext.readOnlyRootFilesystem`   | Set APISIX containers' Security Context runAsNonRoot                                                                     | `true`           |
| `controlPlane.containerSecurityContext.allowPrivilegeEscalation` | Set APISIX container's privilege escalation                                                                              | `false`          |
| `controlPlane.containerSecurityContext.capabilities.drop`        | Set APISIX container's Security Context runAsNonRoot                                                                     | `["ALL"]`        |
| `controlPlane.command`                                           | Override default container command (useful when using custom images)                                                     | `[]`             |
| `controlPlane.args`                                              | Override default container args (useful when using custom images)                                                        | `[]`             |
| `controlPlane.hostAliases`                                       | APISIX pods host aliases                                                                                                 | `[]`             |
| `controlPlane.apiTokenAdmin`                                     | Admin API Token for APISIX control plane                                                                                 | `""`             |
| `controlPlane.apiTokenViewer`                                    | Viewer API Token for APISIX control plane                                                                                | `""`             |
| `controlPlane.existingSecret`                                    | Name of a secret containing API Tokens for APISIX control plane                                                          | `""`             |
| `controlPlane.existingSecretAdminTokenKey`                       | Key inside the secret containing the Admin API Tokens for APISIX control plane                                           | `""`             |
| `controlPlane.existingSecretViewerTokenKey`                      | Key inside the secret containing the Viewer API Tokens for APISIX control plane                                          | `""`             |
| `controlPlane.defaultConfig`                                     | Apisix apisix configuration (evaluated as a template)                                                                    | `""`             |
| `controlPlane.extraConfig`                                       | extra configuration parameters to add to the config.yaml file in APISIX Control plane                                    | `{}`             |
| `controlPlane.existingConfigMap`                                 | name of a ConfigMap with existing configuration for the apisix                                                           | `""`             |
| `controlPlane.extraConfigExistingConfigMap`                      | name of a ConfigMap with existing configuration for the conrol plane                                                     | `""`             |
| `controlPlane.tls.enabled`                                       | Enable TLS transport in Control Plane                                                                                    | `true`           |
| `controlPlane.tls.autoGenerated`                                 | Auto-generate self-signed certificates                                                                                   | `true`           |
| `controlPlane.tls.existingSecret`                                | Name of a secret containing the certificates                                                                             | `""`             |
| `controlPlane.tls.certFilename`                                  | Path of the certificate file when mounted as a secret                                                                    | `tls.crt`        |
| `controlPlane.tls.certKeyFilename`                               | Path of the certificate key file when mounted as a secret                                                                | `tls.key`        |
| `controlPlane.tls.certCAFilename`                                | Path of the certificate CA file when mounted as a secret                                                                 | `ca.crt`         |
| `controlPlane.tls.cert`                                          | Content of the certificate to be added to the secret                                                                     | `""`             |
| `controlPlane.tls.key`                                           | Content of the certificate key to be added to the secret                                                                 | `""`             |
| `controlPlane.tls.ca`                                            | Content of the certificate CA to be added to the secret                                                                  | `""`             |
| `controlPlane.podLabels`                                         | Extra labels for APISIX pods                                                                                             | `{}`             |
| `controlPlane.podAnnotations`                                    | Annotations for APISIX pods                                                                                              | `{}`             |
| `controlPlane.podAffinityPreset`                                 | Pod affinity preset. Ignored if `apisix.affinity` is set. Allowed values: `soft` or `hard`                               | `""`             |
| `controlPlane.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `apisix.affinity` is set. Allowed values: `soft` or `hard`                          | `soft`           |
| `controlPlane.pdb.create`                                        | Enable/disable a Pod Disruption Budget creation                                                                          | `false`          |
| `controlPlane.pdb.minAvailable`                                  | Minimum number/percentage of pods that should remain scheduled                                                           | `1`              |
| `controlPlane.pdb.maxUnavailable`                                | Maximum number/percentage of pods that may be made unavailable                                                           | `""`             |
| `controlPlane.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `apisix.affinity` is set. Allowed values: `soft` or `hard`                         | `""`             |
| `controlPlane.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `apisix.affinity` is set                                                             | `""`             |
| `controlPlane.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `apisix.affinity` is set                                                          | `[]`             |
| `controlPlane.affinity`                                          | Affinity for APISIX pods assignment                                                                                      | `{}`             |
| `controlPlane.nodeSelector`                                      | Node labels for APISIX pods assignment                                                                                   | `{}`             |
| `controlPlane.tolerations`                                       | Tolerations for APISIX pods assignment                                                                                   | `[]`             |
| `controlPlane.updateStrategy.type`                               | APISIX statefulset strategy type                                                                                         | `RollingUpdate`  |
| `controlPlane.priorityClassName`                                 | APISIX pods' priorityClassName                                                                                           | `""`             |
| `controlPlane.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `[]`             |
| `controlPlane.schedulerName`                                     | Name of the k8s scheduler (other than default) for APISIX pods                                                           | `""`             |
| `controlPlane.terminationGracePeriodSeconds`                     | Seconds Redmine pod needs to terminate gracefully                                                                        | `""`             |
| `controlPlane.lifecycleHooks`                                    | for the APISIX container(s) to automate configuration before or after startup                                            | `{}`             |
| `controlPlane.extraEnvVars`                                      | Array with extra environment variables to add to APISIX nodes                                                            | `[]`             |
| `controlPlane.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars for APISIX nodes                                                    | `""`             |
| `controlPlane.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars for APISIX nodes                                                       | `""`             |
| `controlPlane.extraVolumes`                                      | Optionally specify extra list of additional volumes for the APISIX pod(s)                                                | `[]`             |
| `controlPlane.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for the APISIX container(s)                                     | `[]`             |
| `controlPlane.sidecars`                                          | Add additional sidecar containers to the APISIX pod(s)                                                                   | `[]`             |
| `controlPlane.initContainers`                                    | Add additional init containers to the APISIX pod(s)                                                                      | `[]`             |

### APISIX Control Plane Traffic Exposure Parameters

| Name                                            | Description                                                                                                                      | Value                        |
| ----------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| `controlPlane.service.type`                     | APISIX service type                                                                                                              | `ClusterIP`                  |
| `controlPlane.service.ports.adminAPI`           | APISIX service Admin API port                                                                                                    | `9180`                       |
| `controlPlane.service.ports.configServer`       | APISIX service Config Server port                                                                                                | `9280`                       |
| `controlPlane.service.ports.metrics`            | APISIX service metrics port                                                                                                      | `8080`                       |
| `controlPlane.service.nodePorts.adminAPI`       | Node port for Admin API                                                                                                          | `""`                         |
| `controlPlane.service.nodePorts.configServer`   | Node port for Config Server                                                                                                      | `""`                         |
| `controlPlane.service.nodePorts.metrics`        | Node port for Metrics                                                                                                            | `""`                         |
| `controlPlane.service.clusterIP`                | APISIX service Cluster IP                                                                                                        | `""`                         |
| `controlPlane.service.loadBalancerIP`           | APISIX service Load Balancer IP                                                                                                  | `""`                         |
| `controlPlane.service.loadBalancerSourceRanges` | APISIX service Load Balancer sources                                                                                             | `[]`                         |
| `controlPlane.service.externalTrafficPolicy`    | APISIX service external traffic policy                                                                                           | `Cluster`                    |
| `controlPlane.service.annotations`              | Additional custom annotations for APISIX service                                                                                 | `{}`                         |
| `controlPlane.service.extraPorts`               | Extra ports to expose in APISIX service (normally used with the `sidecars` value)                                                | `[]`                         |
| `controlPlane.service.sessionAffinity`          | Control where web requests go, to the same pod or round-robin                                                                    | `None`                       |
| `controlPlane.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                         |
| `controlPlane.ingress.enabled`                  | Enable ingress record generation for Apisix                                                                                      | `false`                      |
| `controlPlane.ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific`     |
| `controlPlane.ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                         |
| `controlPlane.ingress.hostname`                 | Default host for the ingress record                                                                                              | `apisix-control-plane.local` |
| `controlPlane.ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                         |
| `controlPlane.ingress.path`                     | Default path for the ingress record                                                                                              | `/`                          |
| `controlPlane.ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                         |
| `controlPlane.ingress.tls`                      | Enable TLS configuration for the host defined at `controlPlane.ingress.hostname` parameter                                       | `false`                      |
| `controlPlane.ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                      |
| `controlPlane.ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                         |
| `controlPlane.ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                         |
| `controlPlane.ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                         |
| `controlPlane.ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                         |
| `controlPlane.ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                         |

### APISIX Control Plane Autoscaling configuration

| Name                                                   | Description                                                                                                                                                            | Value   |
| ------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `controlPlane.autoscaling.vpa.enabled`                 | Enable VPA                                                                                                                                                             | `false` |
| `controlPlane.autoscaling.vpa.annotations`             | Annotations for VPA resource                                                                                                                                           | `{}`    |
| `controlPlane.autoscaling.vpa.controlledResources`     | VPA List of resources that the vertical pod autoscaler can control. Defaults to cpu and memory                                                                         | `[]`    |
| `controlPlane.autoscaling.vpa.maxAllowed`              | VPA Max allowed resources for the pod                                                                                                                                  | `{}`    |
| `controlPlane.autoscaling.vpa.minAllowed`              | VPA Min allowed resources for the pod                                                                                                                                  | `{}`    |
| `controlPlane.autoscaling.vpa.updatePolicy.updateMode` | Autoscaling update policy Specifies whether recommended updates are applied when a Pod is started and whether recommended updates are applied during the life of a Pod | `Auto`  |
| `controlPlane.autoscaling.hpa.enabled`                 | Enable HPA for APISIX Data Plane                                                                                                                                       | `false` |
| `controlPlane.autoscaling.hpa.minReplicas`             | Minimum number of APISIX Data Plane replicas                                                                                                                           | `""`    |
| `controlPlane.autoscaling.hpa.maxReplicas`             | Maximum number of APISIX Data Plane replicas                                                                                                                           | `""`    |
| `controlPlane.autoscaling.hpa.targetCPU`               | Target CPU utilization percentage                                                                                                                                      | `""`    |
| `controlPlane.autoscaling.hpa.targetMemory`            | Target Memory utilization percentage                                                                                                                                   | `""`    |

### APISIX Control Plane RBAC parameters

| Name                                                       | Description                                                      | Value  |
| ---------------------------------------------------------- | ---------------------------------------------------------------- | ------ |
| `controlPlane.rbac.create`                                 | Specifies whether RBAC resources should be created               | `true` |
| `controlPlane.rbac.rules`                                  | Custom RBAC rules to set                                         | `[]`   |
| `controlPlane.serviceAccount.create`                       | Specifies whether a ServiceAccount should be created             | `true` |
| `controlPlane.serviceAccount.name`                         | The name of the ServiceAccount to use.                           | `""`   |
| `controlPlane.serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template) | `{}`   |
| `controlPlane.serviceAccount.automountServiceAccountToken` | Automount service account token for the apisix service account   | `true` |

### APISIX Control Plane Metrics Parameters

| Name                                                    | Description                                                                                            | Value   |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------- |
| `controlPlane.metrics.enabled`                          | Enable the export of Prometheus metrics                                                                | `false` |
| `controlPlane.metrics.annotations`                      | Annotations for the apisix service in order to scrape metrics                                          | `{}`    |
| `controlPlane.metrics.serviceMonitor.enabled`           | if `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`) | `false` |
| `controlPlane.metrics.serviceMonitor.namespace`         | Namespace in which Prometheus is running                                                               | `""`    |
| `controlPlane.metrics.serviceMonitor.annotations`       | Additional custom annotations for the ServiceMonitor                                                   | `{}`    |
| `controlPlane.metrics.serviceMonitor.labels`            | Extra labels for the ServiceMonitor                                                                    | `{}`    |
| `controlPlane.metrics.serviceMonitor.jobLabel`          | The name of the label on the target service to use as the job name in Prometheus                       | `""`    |
| `controlPlane.metrics.serviceMonitor.honorLabels`       | honorLabels chooses the metric's labels on collisions with target labels                               | `false` |
| `controlPlane.metrics.serviceMonitor.interval`          | Interval at which metrics should be scraped.                                                           | `""`    |
| `controlPlane.metrics.serviceMonitor.scrapeTimeout`     | Timeout after which the scrape is ended                                                                | `""`    |
| `controlPlane.metrics.serviceMonitor.metricRelabelings` | Specify additional relabeling of metrics                                                               | `[]`    |
| `controlPlane.metrics.serviceMonitor.relabelings`       | Specify general relabeling                                                                             | `[]`    |
| `controlPlane.metrics.serviceMonitor.selector`          | Prometheus instance selector labels                                                                    | `{}`    |

### APISIX Dashboard Parameters

| Name                                                          | Description                                                                                                                                                 | Value                      |
| ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| `dashboard.enabled`                                           | Enable APISIX Dashboard                                                                                                                                     | `true`                     |
| `dashboard.replicaCount`                                      | Number of APISIX Dashboard replicas to deploy                                                                                                               | `1`                        |
| `dashboard.image.registry`                                    | APISIX Dashboard image registry                                                                                                                             | `docker.io`                |
| `dashboard.image.repository`                                  | APISIX Dashboard image repository                                                                                                                           | `bitnami/apisix-dashboard` |
| `dashboard.image.tag`                                         | APISIX Dashboard image tag (immutable tags are recommended)                                                                                                 | `3.0.1-debian-11-r5`       |
| `dashboard.image.digest`                                      | APISIX Dashboard image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                       |
| `dashboard.image.pullPolicy`                                  | APISIX Dashboard image pull policy                                                                                                                          | `IfNotPresent`             |
| `dashboard.image.pullSecrets`                                 | APISIX Dashboard image pull secrets                                                                                                                         | `[]`                       |
| `dashboard.image.debug`                                       | Enable APISIX Dashboard image debug mode                                                                                                                    | `false`                    |
| `dashboard.username`                                          | APISIX Dashboard username                                                                                                                                   | `user`                     |
| `dashboard.password`                                          | APISIX Dashboard password                                                                                                                                   | `""`                       |
| `dashboard.existingSecret`                                    | Name of a existing secret containing the password for APISIX Dashboard                                                                                      | `""`                       |
| `dashboard.existingSecretPasswordKey`                         | Key inside the secret containing the password for APISIX Dashboard                                                                                          | `""`                       |
| `dashboard.defaultConfig`                                     | APISIX Dashboard configuration (evaluated as a template)                                                                                                    | `""`                       |
| `dashboard.extraConfig`                                       | extra configuration settings for APISIX Dashboard                                                                                                           | `{}`                       |
| `dashboard.existingConfigMap`                                 | name of a ConfigMap with existing configuration for the Dashboard                                                                                           | `""`                       |
| `dashboard.extraConfigExistingConfigMap`                      | name of a ConfigMap with existing configuration for the Dashboard                                                                                           | `""`                       |
| `dashboard.tls.enabled`                                       | Enable TLS transport in Dashboard                                                                                                                           | `true`                     |
| `dashboard.tls.autoGenerated`                                 | Auto-generate self-signed certificates                                                                                                                      | `true`                     |
| `dashboard.tls.existingSecret`                                | Name of a secret containing the certificates                                                                                                                | `""`                       |
| `dashboard.tls.certFilename`                                  | Path of the certificate file when mounted as a secret                                                                                                       | `tls.crt`                  |
| `dashboard.tls.certKeyFilename`                               | Path of the certificate key file when mounted as a secret                                                                                                   | `tls.key`                  |
| `dashboard.tls.certCAFilename`                                | Path of the certificate CA file when mounted as a secret                                                                                                    | `ca.crt`                   |
| `dashboard.tls.cert`                                          | Content of the certificate to be added to the secret                                                                                                        | `""`                       |
| `dashboard.tls.key`                                           | Content of the certificate key to be added to the secret                                                                                                    | `""`                       |
| `dashboard.tls.ca`                                            | Content of the certificate CA to be added to the secret                                                                                                     | `""`                       |
| `dashboard.hostAliases`                                       | APISIX Dashboard pods host aliases                                                                                                                          | `[]`                       |
| `dashboard.podLabels`                                         | Extra labels for APISIX Dashboard pods                                                                                                                      | `{}`                       |
| `dashboard.podAnnotations`                                    | Annotations for APISIX Dashboard pods                                                                                                                       | `{}`                       |
| `dashboard.podAffinityPreset`                                 | Pod affinity preset. Ignored if `dashboard.affinity` is set. Allowed values: `soft` or `hard`                                                               | `""`                       |
| `dashboard.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `dashboard.affinity` is set. Allowed values: `soft` or `hard`                                                          | `soft`                     |
| `dashboard.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `dashboard.affinity` is set. Allowed values: `soft` or `hard`                                                         | `""`                       |
| `dashboard.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `dashboard.affinity` is set                                                                                             | `""`                       |
| `dashboard.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `dashboard.affinity` is set                                                                                          | `[]`                       |
| `dashboard.affinity`                                          | Affinity for APISIX Dashboard pods assignment                                                                                                               | `{}`                       |
| `dashboard.nodeSelector`                                      | Node labels for APISIX Dashboard pods assignment                                                                                                            | `{}`                       |
| `dashboard.tolerations`                                       | Tolerations for APISIX Dashboard pods assignment                                                                                                            | `[]`                       |
| `dashboard.updateStrategy.type`                               | APISIX Dashboard statefulset strategy type                                                                                                                  | `RollingUpdate`            |
| `dashboard.priorityClassName`                                 | APISIX Dashboard pods' priorityClassName                                                                                                                    | `""`                       |
| `dashboard.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                                    | `[]`                       |
| `dashboard.schedulerName`                                     | Name of the k8s scheduler (other than default) for APISIX Dashboard pods                                                                                    | `""`                       |
| `dashboard.terminationGracePeriodSeconds`                     | Seconds Redmine pod needs to terminate gracefully                                                                                                           | `""`                       |
| `dashboard.extraVolumes`                                      | Optionally specify extra list of additional volumes for the APISIX Dashboard pod(s)                                                                         | `[]`                       |
| `dashboard.sidecars`                                          | Add additional sidecar containers to the APISIX Dashboard pod(s)                                                                                            | `[]`                       |
| `dashboard.initContainers`                                    | Add additional init containers to the APISIX Dashboard pod(s)                                                                                               | `[]`                       |
| `dashboard.podSecurityContext.enabled`                        | Enabled Dashboard pods' Security Context                                                                                                                    | `true`                     |
| `dashboard.podSecurityContext.fsGroup`                        | Set Dashboard pod's Security Context fsGroup                                                                                                                | `1001`                     |
| `dashboard.podSecurityContext.seccompProfile.type`            | Set Dashboard pod's Security Context seccomp profile                                                                                                        | `RuntimeDefault`           |
| `dashboard.containerPorts.http`                               | Dashboard http container port                                                                                                                               | `8080`                     |
| `dashboard.containerPorts.https`                              | Dashboard https container port                                                                                                                              | `8443`                     |
| `dashboard.livenessProbe.enabled`                             | Enable livenessProbe on Dashboard container                                                                                                                 | `true`                     |
| `dashboard.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                                                     | `5`                        |
| `dashboard.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                                                            | `10`                       |
| `dashboard.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                                                           | `5`                        |
| `dashboard.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                                                         | `5`                        |
| `dashboard.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                                                         | `1`                        |
| `dashboard.readinessProbe.enabled`                            | Enable readinessProbe on Dashboard container                                                                                                                | `true`                     |
| `dashboard.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                                                    | `5`                        |
| `dashboard.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                                                           | `10`                       |
| `dashboard.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                                                          | `5`                        |
| `dashboard.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                                                        | `5`                        |
| `dashboard.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                                                        | `1`                        |
| `dashboard.startupProbe.enabled`                              | Enable startupProbe on Dashboard container                                                                                                                  | `false`                    |
| `dashboard.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                                                                                      | `5`                        |
| `dashboard.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                                                                                             | `10`                       |
| `dashboard.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                                                                                            | `5`                        |
| `dashboard.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                                                                                          | `5`                        |
| `dashboard.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                                                                                          | `1`                        |
| `dashboard.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                                                         | `{}`                       |
| `dashboard.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                                                        | `{}`                       |
| `dashboard.customStartupProbe`                                | Custom startupProbe that overrides the default one                                                                                                          | `{}`                       |
| `dashboard.resources.limits`                                  | The resources limits for the Dashboard container                                                                                                            | `{}`                       |
| `dashboard.resources.requests`                                | The requested resources for the Dashboard container                                                                                                         | `{}`                       |
| `dashboard.containerSecurityContext.enabled`                  | Enabled Dashboard container' Security Context                                                                                                               | `true`                     |
| `dashboard.containerSecurityContext.runAsUser`                | Set Dashboard container' Security Context runAsUser                                                                                                         | `1001`                     |
| `dashboard.containerSecurityContext.runAsNonRoot`             | Set Dashboard container' Security Context runAsNonRoot                                                                                                      | `true`                     |
| `dashboard.containerSecurityContext.readOnlyRootFilesystem`   | Set Dashboard container' Security Context runAsNonRoot                                                                                                      | `true`                     |
| `dashboard.containerSecurityContext.allowPrivilegeEscalation` | Set Dashboard container's privilege escalation                                                                                                              | `false`                    |
| `dashboard.containerSecurityContext.capabilities.drop`        | Set Dashboard container's Security Context runAsNonRoot                                                                                                     | `["ALL"]`                  |
| `dashboard.command`                                           | Override default container command (useful when using custom images)                                                                                        | `[]`                       |
| `dashboard.args`                                              | Override default container args (useful when using custom images)                                                                                           | `[]`                       |
| `dashboard.lifecycleHooks`                                    | for the Dashboard container(s) to automate configuration before or after startup                                                                            | `{}`                       |
| `dashboard.extraEnvVars`                                      | Array with extra environment variables to add to Dashboard nodes                                                                                            | `[]`                       |
| `dashboard.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars for Dashboard nodes                                                                                    | `""`                       |
| `dashboard.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars for Dashboard nodes                                                                                       | `""`                       |
| `dashboard.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for the APISIX Dashboard container                                                                 | `[]`                       |

### APISIX Dashboard Traffic Exposure Parameters

| Name                                         | Description                                                                                                                      | Value                    |
| -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `dashboard.service.type`                     | APISIX Dashboard service type                                                                                                    | `LoadBalancer`           |
| `dashboard.service.ports.http`               | APISIX Dashboard service HTTP                                                                                                    | `80`                     |
| `dashboard.service.ports.https`              | APISIX Dashboard service HTTPS                                                                                                   | `443`                    |
| `dashboard.service.nodePorts.http`           | Node port for HTTP                                                                                                               | `""`                     |
| `dashboard.service.nodePorts.https`          | Node port for HTTPS                                                                                                              | `""`                     |
| `dashboard.service.clusterIP`                | APISIX Dashboard service Cluster IP                                                                                              | `""`                     |
| `dashboard.service.loadBalancerIP`           | APISIX Dashboard service Load Balancer IP                                                                                        | `""`                     |
| `dashboard.service.loadBalancerSourceRanges` | APISIX Dashboard service Load Balancer sources                                                                                   | `[]`                     |
| `dashboard.service.externalTrafficPolicy`    | APISIX Dashboard service external traffic policy                                                                                 | `Cluster`                |
| `dashboard.service.annotations`              | Additional custom annotations for APISIX Dashboard service                                                                       | `{}`                     |
| `dashboard.service.extraPorts`               | Extra ports to expose in APISIX Dashboard service (normally used with the `sidecars` value)                                      | `[]`                     |
| `dashboard.service.sessionAffinity`          | Control where web requests go, to the same pod or round-robin                                                                    | `None`                   |
| `dashboard.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `dashboard.ingress.enabled`                  | Enable ingress record generation for Apisix                                                                                      | `false`                  |
| `dashboard.ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `dashboard.ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `dashboard.ingress.hostname`                 | Default host for the ingress record                                                                                              | `apisix-dashboard.local` |
| `dashboard.ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `dashboard.ingress.path`                     | Default path for the ingress record                                                                                              | `/`                      |
| `dashboard.ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `dashboard.ingress.tls`                      | Enable TLS configuration for the host defined at `dashboard.ingress.hostname` parameter                                          | `false`                  |
| `dashboard.ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `dashboard.ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `dashboard.ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `dashboard.ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `dashboard.ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                     |
| `dashboard.ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### APISIX Dashboard Autoscaling configuration

| Name                                                | Description                                                                                                                                                            | Value   |
| --------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `dashboard.autoscaling.vpa.enabled`                 | Enable VPA                                                                                                                                                             | `false` |
| `dashboard.autoscaling.vpa.annotations`             | Annotations for VPA resource                                                                                                                                           | `{}`    |
| `dashboard.autoscaling.vpa.controlledResources`     | VPA List of resources that the vertical pod autoscaler can control. Defaults to cpu and memory                                                                         | `[]`    |
| `dashboard.autoscaling.vpa.maxAllowed`              | VPA Max allowed resources for the pod                                                                                                                                  | `{}`    |
| `dashboard.autoscaling.vpa.minAllowed`              | VPA Min allowed resources for the pod                                                                                                                                  | `{}`    |
| `dashboard.autoscaling.vpa.updatePolicy.updateMode` | Autoscaling update policy Specifies whether recommended updates are applied when a Pod is started and whether recommended updates are applied during the life of a Pod | `Auto`  |
| `dashboard.autoscaling.hpa.enabled`                 | Enable HPA for APISIX Dashboard                                                                                                                                        | `false` |
| `dashboard.autoscaling.hpa.minReplicas`             | Minimum number of APISIX Dashboard replicas                                                                                                                            | `""`    |
| `dashboard.autoscaling.hpa.maxReplicas`             | Maximum number of APISIX Dashboard replicas                                                                                                                            | `""`    |
| `dashboard.autoscaling.hpa.targetCPU`               | Target CPU utilization percentage                                                                                                                                      | `""`    |
| `dashboard.autoscaling.hpa.targetMemory`            | Target Memory utilization percentage                                                                                                                                   | `""`    |

### APISIX Dashboard RBAC Parameters

| Name                                                    | Description                                                      | Value  |
| ------------------------------------------------------- | ---------------------------------------------------------------- | ------ |
| `dashboard.serviceAccount.create`                       | Specifies whether a ServiceAccount should be created             | `true` |
| `dashboard.serviceAccount.name`                         | The name of the ServiceAccount to use.                           | `""`   |
| `dashboard.serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template) | `{}`   |
| `dashboard.serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account   | `true` |

### APISIX Ingress Controller Parameters

| Name                                                                  | Description                                                                                                                                                          | Value                               |
| --------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| `ingressController.enabled`                                           | Enable APISIX Ingress Controller                                                                                                                                     | `true`                              |
| `ingressController.image.registry`                                    | APISIX Ingress Controller image registry                                                                                                                             | `docker.io`                         |
| `ingressController.image.repository`                                  | APISIX Ingress Controller image repository                                                                                                                           | `bitnami/apisix-ingress-controller` |
| `ingressController.image.tag`                                         | APISIX Ingress Controller image tag (immutable tags are recommended)                                                                                                 | `1.6.1-debian-11-r5`                |
| `ingressController.image.digest`                                      | APISIX Ingress Controller image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                                |
| `ingressController.image.pullPolicy`                                  | APISIX Ingress Controller image pull policy                                                                                                                          | `IfNotPresent`                      |
| `ingressController.image.pullSecrets`                                 | APISIX Ingress Controller image pull secrets                                                                                                                         | `[]`                                |
| `ingressController.image.debug`                                       | Enable APISIX Ingress Controller image debug mode                                                                                                                    | `false`                             |
| `ingressController.replicaCount`                                      | Number of APISIX Ingress Controller replicas to deploy                                                                                                               | `1`                                 |
| `ingressController.containerPorts.http`                               | APISIX Ingress Controller http container port                                                                                                                        | `8080`                              |
| `ingressController.containerPorts.https`                              | APISIX Ingress Controller https container port                                                                                                                       | `8443`                              |
| `ingressController.livenessProbe.enabled`                             | Enable livenessProbe on APISIX Ingress Controller containers                                                                                                         | `true`                              |
| `ingressController.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                                                              | `5`                                 |
| `ingressController.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                                                                     | `10`                                |
| `ingressController.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                                                                    | `5`                                 |
| `ingressController.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                                                                  | `5`                                 |
| `ingressController.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                                                                  | `1`                                 |
| `ingressController.readinessProbe.enabled`                            | Enable readinessProbe on APISIX Ingress Controller containers                                                                                                        | `true`                              |
| `ingressController.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                                                             | `5`                                 |
| `ingressController.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                                                                    | `10`                                |
| `ingressController.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                                                                   | `5`                                 |
| `ingressController.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                                                                 | `5`                                 |
| `ingressController.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                                                                 | `1`                                 |
| `ingressController.startupProbe.enabled`                              | Enable startupProbe on APISIX Ingress Controller containers                                                                                                          | `false`                             |
| `ingressController.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                                                                                               | `5`                                 |
| `ingressController.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                                                                                                      | `10`                                |
| `ingressController.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                                                                                                     | `5`                                 |
| `ingressController.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                                                                                                   | `5`                                 |
| `ingressController.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                                                                                                   | `1`                                 |
| `ingressController.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                                                                  | `{}`                                |
| `ingressController.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                                                                 | `{}`                                |
| `ingressController.customStartupProbe`                                | Custom startupProbe that overrides the default one                                                                                                                   | `{}`                                |
| `ingressController.resources.limits`                                  | The resources limits for the APISIX Ingress Controller containers                                                                                                    | `{}`                                |
| `ingressController.resources.requests`                                | The requested resources for the APISIX Ingress Controller containers                                                                                                 | `{}`                                |
| `ingressController.podSecurityContext.enabled`                        | Enabled APISIX Ingress Controller pods' Security Context                                                                                                             | `true`                              |
| `ingressController.podSecurityContext.fsGroup`                        | Set APISIX Ingress Controller pod's Security Context fsGroup                                                                                                         | `1001`                              |
| `ingressController.podSecurityContext.seccompProfile.type`            | Set APISIX Ingress Controller container's Security Context seccomp profile                                                                                           | `RuntimeDefault`                    |
| `ingressController.containerSecurityContext.enabled`                  | Enabled APISIX Ingress Controller containers' Security Context                                                                                                       | `true`                              |
| `ingressController.containerSecurityContext.runAsUser`                | Set APISIX Ingress Controller containers' Security Context runAsUser                                                                                                 | `1001`                              |
| `ingressController.containerSecurityContext.runAsNonRoot`             | Set APISIX Ingress Controller containers' Security Context runAsNonRoot                                                                                              | `true`                              |
| `ingressController.containerSecurityContext.readOnlyRootFilesystem`   | Set APISIX Ingress Controller containers' Security Context runAsNonRoot                                                                                              | `true`                              |
| `ingressController.containerSecurityContext.allowPrivilegeEscalation` | Set APISIX Ingress Controller container's privilege escalation                                                                                                       | `false`                             |
| `ingressController.containerSecurityContext.capabilities.drop`        | Set APISIX Ingress Controller container's Security Context runAsNonRoot                                                                                              | `["ALL"]`                           |
| `ingressController.command`                                           | Override default container command (useful when using custom images)                                                                                                 | `[]`                                |
| `ingressController.args`                                              | Override default container args (useful when using custom images)                                                                                                    | `[]`                                |
| `ingressController.hostAliases`                                       | APISIX Ingress Controller pods host aliases                                                                                                                          | `[]`                                |
| `ingressController.podLabels`                                         | Extra labels for APISIX Ingress Controller pods                                                                                                                      | `{}`                                |
| `ingressController.podAnnotations`                                    | Annotations for APISIX Ingress Controller pods                                                                                                                       | `{}`                                |
| `ingressController.podAffinityPreset`                                 | Pod affinity preset. Ignored if `injector.affinity` is set. Allowed values: `soft` or `hard`                                                                         | `""`                                |
| `ingressController.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `injector.affinity` is set. Allowed values: `soft` or `hard`                                                                    | `soft`                              |
| `ingressController.pdb.create`                                        | Enable/disable a Pod Disruption Budget creation                                                                                                                      | `false`                             |
| `ingressController.pdb.minAvailable`                                  | Minimum number/percentage of pods that should remain scheduled                                                                                                       | `1`                                 |
| `ingressController.pdb.maxUnavailable`                                | Maximum number/percentage of pods that may be made unavailable                                                                                                       | `""`                                |
| `ingressController.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `injector.affinity` is set. Allowed values: `soft` or `hard`                                                                   | `""`                                |
| `ingressController.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `injector.affinity` is set                                                                                                       | `""`                                |
| `ingressController.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `injector.affinity` is set                                                                                                    | `[]`                                |
| `ingressController.affinity`                                          | Affinity for APISIX Ingress Controller pods assignment                                                                                                               | `{}`                                |
| `ingressController.nodeSelector`                                      | Node labels for APISIX Ingress Controller pods assignment                                                                                                            | `{}`                                |
| `ingressController.tolerations`                                       | Tolerations for APISIX Ingress Controller pods assignment                                                                                                            | `[]`                                |
| `ingressController.updateStrategy.type`                               | APISIX Ingress Controller statefulset strategy type                                                                                                                  | `RollingUpdate`                     |
| `ingressController.priorityClassName`                                 | APISIX Ingress Controller pods' priorityClassName                                                                                                                    | `""`                                |
| `ingressController.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                                             | `[]`                                |
| `ingressController.schedulerName`                                     | Name of the k8s scheduler (other than default) for APISIX Ingress Controller pods                                                                                    | `""`                                |
| `ingressController.terminationGracePeriodSeconds`                     | Seconds Redmine pod needs to terminate gracefully                                                                                                                    | `""`                                |
| `ingressController.lifecycleHooks`                                    | for the APISIX Ingress Controller container(s) to automate configuration before or after startup                                                                     | `{}`                                |
| `ingressController.extraEnvVars`                                      | Array with extra environment variables to add to APISIX Ingress Controller nodes                                                                                     | `[]`                                |
| `ingressController.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars for APISIX Ingress Controller nodes                                                                             | `""`                                |
| `ingressController.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars for APISIX Ingress Controller nodes                                                                                | `""`                                |
| `ingressController.extraVolumes`                                      | Optionally specify extra list of additional volumes for the APISIX Ingress Controller pod(s)                                                                         | `[]`                                |
| `ingressController.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for the APISIX Ingress Controller container(s)                                                              | `[]`                                |
| `ingressController.sidecars`                                          | Add additional sidecar containers to the APISIX Ingress Controller pod(s)                                                                                            | `[]`                                |
| `ingressController.initContainers`                                    | Add additional init containers to the APISIX Ingress Controller pod(s)                                                                                               | `[]`                                |
| `ingressController.defaultConfig`                                     | APISIX Dashboard configuration (evaluated as a template)                                                                                                             | `""`                                |
| `ingressController.extraConfig`                                       | Extra configuration parameters for APISIX Ingress Controller                                                                                                         | `{}`                                |
| `ingressController.existingConfigMap`                                 | name of a ConfigMap with existing configuration for the Dashboard                                                                                                    | `""`                                |
| `ingressController.extraConfigExistingConfigMap`                      | name of a ConfigMap with existing configuration for the Dashboard                                                                                                    | `""`                                |
| `ingressController.tls.enabled`                                       | Enable TLS transport in Ingress Controller                                                                                                                           | `true`                              |
| `ingressController.tls.autoGenerated`                                 | Auto-generate self-signed certificates                                                                                                                               | `true`                              |
| `ingressController.tls.existingSecret`                                | Name of a secret containing the certificates                                                                                                                         | `""`                                |
| `ingressController.tls.certFilename`                                  | Path of the certificate file when mounted as a secret                                                                                                                | `tls.crt`                           |
| `ingressController.tls.certKeyFilename`                               | Path of the certificate key file when mounted as a secret                                                                                                            | `tls.key`                           |
| `ingressController.tls.certCAFilename`                                | Path of the certificate CA file when mounted as a secret                                                                                                             | `ca.crt`                            |
| `ingressController.tls.cert`                                          | Content of the certificate to be added to the secret                                                                                                                 | `""`                                |
| `ingressController.tls.key`                                           | Content of the certificate key to be added to the secret                                                                                                             | `""`                                |
| `ingressController.tls.ca`                                            | Content of the certificate CA to be added to the secret                                                                                                              | `""`                                |

### APISIX Ingress Controller Traffic Exposure Parameters

| Name                                                 | Description                                                                                                                      | Value                             |
| ---------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | --------------------------------- |
| `ingressController.service.type`                     | APISIX Ingress Controller service type                                                                                           | `ClusterIP`                       |
| `ingressController.service.ports.http`               | APISIX Ingress Controller service HTTP port                                                                                      | `80`                              |
| `ingressController.service.ports.https`              | APISIX Ingress Controller service HTTPS port                                                                                     | `443`                             |
| `ingressController.service.nodePorts.http`           | Node port for HTTP                                                                                                               | `""`                              |
| `ingressController.service.nodePorts.https`          | Node port for HTTPS                                                                                                              | `""`                              |
| `ingressController.service.clusterIP`                | APISIX Ingress Controller service Cluster IP                                                                                     | `""`                              |
| `ingressController.service.loadBalancerIP`           | APISIX Ingress Controller service Load Balancer IP                                                                               | `""`                              |
| `ingressController.service.loadBalancerSourceRanges` | APISIX Ingress Controller service Load Balancer sources                                                                          | `[]`                              |
| `ingressController.service.externalTrafficPolicy`    | APISIX Ingress Controller service external traffic policy                                                                        | `Cluster`                         |
| `ingressController.service.annotations`              | Additional custom annotations for APISIX Ingress Controller service                                                              | `{}`                              |
| `ingressController.service.extraPorts`               | Extra ports to expose in APISIX Ingress Controller service (normally used with the `sidecars` value)                             | `[]`                              |
| `ingressController.service.sessionAffinity`          | Control where web requests go, to the same pod or round-robin                                                                    | `None`                            |
| `ingressController.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                              |
| `ingressController.ingress.enabled`                  | Enable ingress record generation for Apisix                                                                                      | `false`                           |
| `ingressController.ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific`          |
| `ingressController.ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                              |
| `ingressController.ingress.hostname`                 | Default host for the ingress record                                                                                              | `apisix-ingress-controller.local` |
| `ingressController.ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                              |
| `ingressController.ingress.path`                     | Default path for the ingress record                                                                                              | `/`                               |
| `ingressController.ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                              |
| `ingressController.ingress.tls`                      | Enable TLS configuration for the host defined at `ingressController.ingress.hostname` parameter                                  | `false`                           |
| `ingressController.ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                           |
| `ingressController.ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                              |
| `ingressController.ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                              |
| `ingressController.ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                              |
| `ingressController.ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                              |
| `ingressController.ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                              |

### APISIX Ingress Controller Autoscaling configuration

| Name                                                        | Description                                                                                                                                                            | Value   |
| ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `ingressController.autoscaling.vpa.enabled`                 | Enable VPA                                                                                                                                                             | `false` |
| `ingressController.autoscaling.vpa.annotations`             | Annotations for VPA resource                                                                                                                                           | `{}`    |
| `ingressController.autoscaling.vpa.controlledResources`     | VPA List of resources that the vertical pod autoscaler can control. Defaults to cpu and memory                                                                         | `[]`    |
| `ingressController.autoscaling.vpa.maxAllowed`              | VPA Max allowed resources for the pod                                                                                                                                  | `{}`    |
| `ingressController.autoscaling.vpa.minAllowed`              | VPA Min allowed resources for the pod                                                                                                                                  | `{}`    |
| `ingressController.autoscaling.vpa.updatePolicy.updateMode` | Autoscaling update policy Specifies whether recommended updates are applied when a Pod is started and whether recommended updates are applied during the life of a Pod | `Auto`  |
| `ingressController.autoscaling.hpa.enabled`                 | Enable HPA for APISIX Ingress Controller                                                                                                                               | `false` |
| `ingressController.autoscaling.hpa.minReplicas`             | Minimum number of APISIX Ingress Controller replicas                                                                                                                   | `""`    |
| `ingressController.autoscaling.hpa.maxReplicas`             | Maximum number of APISIX Ingress Controller replicas                                                                                                                   | `""`    |
| `ingressController.autoscaling.hpa.targetCPU`               | Target CPU utilization percentage                                                                                                                                      | `""`    |
| `ingressController.autoscaling.hpa.targetMemory`            | Target Memory utilization percentage                                                                                                                                   | `""`    |

### APISIX Ingress Controller RBAC Parameters

| Name                                                            | Description                                                                                            | Value   |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------- |
| `ingressController.rbac.create`                                 | Specifies whether RBAC resources should be created                                                     | `true`  |
| `ingressController.rbac.rules`                                  | Custom RBAC rules to set                                                                               | `[]`    |
| `ingressController.serviceAccount.create`                       | Specifies whether a ServiceAccount should be created                                                   | `true`  |
| `ingressController.serviceAccount.name`                         | The name of the ServiceAccount to use.                                                                 | `""`    |
| `ingressController.serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template)                                       | `{}`    |
| `ingressController.serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account                                         | `true`  |
| `ingressController.metrics.enabled`                             | Enable the export of Prometheus metrics                                                                | `false` |
| `ingressController.metrics.annotations`                         | Annotations for the apisix service in order to scrape metrics                                          | `{}`    |
| `ingressController.metrics.serviceMonitor.enabled`              | if `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`) | `false` |
| `ingressController.metrics.serviceMonitor.namespace`            | Namespace in which Prometheus is running                                                               | `""`    |
| `ingressController.metrics.serviceMonitor.annotations`          | Additional custom annotations for the ServiceMonitor                                                   | `{}`    |
| `ingressController.metrics.serviceMonitor.labels`               | Extra labels for the ServiceMonitor                                                                    | `{}`    |
| `ingressController.metrics.serviceMonitor.jobLabel`             | The name of the label on the target service to use as the job name in Prometheus                       | `""`    |
| `ingressController.metrics.serviceMonitor.honorLabels`          | honorLabels chooses the metric's labels on collisions with target labels                               | `false` |
| `ingressController.metrics.serviceMonitor.interval`             | Interval at which metrics should be scraped.                                                           | `""`    |
| `ingressController.metrics.serviceMonitor.scrapeTimeout`        | Timeout after which the scrape is ended                                                                | `""`    |
| `ingressController.metrics.serviceMonitor.metricRelabelings`    | Specify additional relabeling of metrics                                                               | `[]`    |
| `ingressController.metrics.serviceMonitor.relabelings`          | Specify general relabeling                                                                             | `[]`    |
| `ingressController.metrics.serviceMonitor.selector`             | Prometheus instance selector labels                                                                    | `{}`    |

### Init containers parameters

| Name                                                              | Description                                                                                                                   | Value                   |
| ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `waitContainer.image.registry`                                    | Init container wait-container image registry                                                                                  | `docker.io`             |
| `waitContainer.image.repository`                                  | Init container wait-container image name                                                                                      | `bitnami/bitnami-shell` |
| `waitContainer.image.tag`                                         | Init container wait-container image tag                                                                                       | `11-debian-11-r118`     |
| `waitContainer.image.digest`                                      | Init container wait-container image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `waitContainer.image.pullPolicy`                                  | Init container wait-container image pull policy                                                                               | `IfNotPresent`          |
| `waitContainer.image.pullSecrets`                                 | Specify docker-registry secret names as an array                                                                              | `[]`                    |
| `waitContainer.containerSecurityContext.enabled`                  | Enabled APISIX containers' Security Context                                                                                   | `true`                  |
| `waitContainer.containerSecurityContext.runAsUser`                | Set APISIX containers' Security Context runAsUser                                                                             | `1001`                  |
| `waitContainer.containerSecurityContext.runAsNonRoot`             | Set APISIX containers' Security Context runAsNonRoot                                                                          | `true`                  |
| `waitContainer.containerSecurityContext.readOnlyRootFilesystem`   | Set APISIX containers' Security Context runAsNonRoot                                                                          | `true`                  |
| `waitContainer.containerSecurityContext.allowPrivilegeEscalation` | Set APISIX container's privilege escalation                                                                                   | `false`                 |
| `waitContainer.containerSecurityContext.capabilities.drop`        | Set APISIX container's Security Context runAsNonRoot                                                                          | `["ALL"]`               |

### External etcd settings

| Name                                     | Description                                                 | Value                |
| ---------------------------------------- | ----------------------------------------------------------- | -------------------- |
| `externalEtcd.servers`                   | List of hostnames of the external etcd                      | `[]`                 |
| `externalEtcd.port`                      | Port of the external etcd instance                          | `2379`               |
| `externalEtcd.user`                      | User of the external etcd instance                          | `root`               |
| `externalEtcd.password`                  | Password of the external etcd instance                      | `""`                 |
| `externalEtcd.existingSecret`            | Name of a secret containing the external etcd password      | `""`                 |
| `externalEtcd.existingSecretPasswordKey` | Key inside the secret containing the external etcd password | `etcd-root-password` |
| `externalEtcd.secureTransport`           | Use TLS for client-to-server communications                 | `false`              |

### etcd sub-chart parameters

| Name                               | Description                                 | Value   |
| ---------------------------------- | ------------------------------------------- | ------- |
| `etcd.enabled`                     | Deploy etcd sub-chart                       | `true`  |
| `etcd.replicaCount`                | Number of etcd replicas                     | `3`     |
| `etcd.containerPorts.client`       | Container port for etcd                     | `2379`  |
| `etcd.auth.rbac.create`            | Switch to enable RBAC authentication        | `false` |
| `etcd.auth.rbac.rootPassword`      | etcd root password                          | `""`    |
| `etcd.auth.client.secureTransport` | use TLS for client-to-server communications | `false` |

The above parameters map to the env variables defined in [bitnami/apisix](https://github.com/bitnami/containers/tree/main/bitnami/apisix). For more information please refer to the [bitnami/apisix](https://github.com/bitnami/containers/tree/main/bitnami/apisix) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set controlPlane.enabled=true \
    my-repo/apisix
```

The above command enables the APISIX Control Plane deployment.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml my-repo/apisix
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Deployment modes

Apache APISIX supports [multiple deployment modes](https://apisix.apache.org/docs/apisix/deployment-modes/). The Bitnami APISIX chart deploys the `decoupled` mode by default, but it is possible to deploy in `traditional` or `standalone` modes as well.

#### Traditional mode

The following values configure the traditional mode:

``` yaml
dataPlane:
  enabled: false
controlPlane:
  extraConfig:
    deployment:
      role: traditional
      role_traditional:
        config_provider: etcd
  service:
    extraPorts:
      - name: http
        port: 80
        targetPort: 9080
      - name: https
        port: 443
        targetPort: 9443
```

#### Standalone mode

The following values configure the standalone mode:

``` yaml
controlPlane:
  enabled: false
ingressController:
  enabled: false
etcd:
  enabled: false
dataPlane:
  extraConfig:
    deployment:
      role_data_plane:
        config_provider: yaml
  extraVolumes:
    - name: routes
      configMap:
        name: apisix-routes
  extraVolumeMounts:
    - name: routes
      mountPath: /opt/bitnami/apisix/conf/apisix.yaml
      subPath: apisix.yaml
extraDeploy:
  - apiVersion: v1
    kind: ConfigMap
    metadata:
      name: apisix-routes
    data:
      apisix.yaml: |-
        routes:
          -
            uri: /hello
            upstream:
                nodes:
                    "127.0.0.1:1980": 1
                type: roundrobin
```

### Ingress

This chart provides support for Ingress resources. If you have an ingress controller installed on your cluster, such as [nginx-ingress-controller](https://github.com/bitnami/charts/tree/main/bitnami/nginx-ingress-controller) or [contour](https://github.com/bitnami/charts/tree/main/bitnami/contour) you can utilize the ingress controller to serve your application.

To enable Ingress integration, set `ingress.enabled` to `true`. The `ingress.hostname` property can be used to set the host name. The `ingress.tls` parameter can be used to add the TLS configuration for this host. It is also possible to have more than one host, with a separate TLS configuration for each host. [Learn more about configuring and using Ingress](https://docs.bitnami.com/kubernetes/apps/apisix/configuration/configure-ingress/).

### TLS secrets

The chart also facilitates the creation of TLS secrets for use with the Ingress controller, with different options for certificate management. [Learn more about TLS secrets](https://docs.bitnami.com/kubernetes/apps/apisix/administration/enable-tls-ingress/).

### External etcd support

You may want to have Mastodon connect to an external etcd rather than installing one inside your cluster. Typical reasons for this are to use a managed database service, or to share a common database server for all your applications. To achieve this, the chart allows you to specify credentials for an external database with the [`externalEtcd` parameter](#parameters). You should also disable the etcd installation with the `etcd.enabled` option. Here is an example:

```yaml
etcd:
  enabled: false
externalEtcd:
  hosts:
    - externalhost
```

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property inside the `dataPlane`, `controlPlane`, `dashboard` and `ingressController` sections.

```yaml
dataPlane:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values inside the `dataPlane`, `controlPlane`, `dashboard` and `ingressController` sections.

### Sidecars

If additional containers are needed in the same pod as apisix (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter inside the `dataPlane`, `controlPlane`, `dashboard` and `ingressController` sections. If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/apps/apisix/administration/configure-use-sidecars/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside the `dataPlane`, `controlPlane`, `dashboard` and `ingressController` sections.

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