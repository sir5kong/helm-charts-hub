<!--- app-name: TensorFlow ResNet -->

# TensorFlow ResNet packaged by Bitnami

TensorFlow ResNet is a client utility for use with TensorFlow Serving and ResNet models.

[Overview of TensorFlow ResNet](https://github.com/tensorflow/models)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/tensorflow-resnet
```

## Introduction

This chart bootstraps a TensorFlow Serving ResNet deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/tensorflow-resnet
```

These commands deploy Tensorflow Serving ResNet model on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

You can check your releases with:

```console
helm list
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |

### Common parameters

| Name                     | Description                                                                                  | Value          |
| ------------------------ | -------------------------------------------------------------------------------------------- | -------------- |
| `kubeVersion`            | Force target Kubernetes version (using Helm capabilities if not set)                         | `""`           |
| `nameOverride`           | String to partially override common.names.fullname template (will maintain the release name) | `""`           |
| `fullnameOverride`       | String to fully override common.names.fullname template                                      | `""`           |
| `commonAnnotations`      | Annotations to add to all deployed objects                                                   | `{}`           |
| `commonLabels`           | Labels to add to all deployed objects                                                        | `{}`           |
| `extraDeploy`            | Array of extra objects to deploy with the release                                            | `[]`           |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)      | `false`        |
| `diagnosticMode.command` | Command to override all containers in the deployment                                         | `["sleep"]`    |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                            | `["infinity"]` |

### TensorFlow parameters

| Name                                    | Description                                                                                                        | Value                        |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ---------------------------- |
| `server.image.registry`                 | TensorFlow Serving image registry                                                                                  | `docker.io`                  |
| `server.image.repository`               | TensorFlow Serving image repository                                                                                | `bitnami/tensorflow-serving` |
| `server.image.tag`                      | TensorFlow Serving Image tag (immutable tags are recommended)                                                      | `2.12.1-debian-11-r5`        |
| `server.image.digest`                   | TensorFlow Serving image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                         |
| `server.image.pullPolicy`               | TensorFlow Serving image pull policy                                                                               | `IfNotPresent`               |
| `server.image.pullSecrets`              | Specify docker-registry secret names as an array                                                                   | `[]`                         |
| `client.image.registry`                 | TensorFlow ResNet image registry                                                                                   | `docker.io`                  |
| `client.image.repository`               | TensorFlow ResNet image repository                                                                                 | `bitnami/tensorflow-resnet`  |
| `client.image.tag`                      | TensorFlow ResNet image tag (immutable tags are recommended)                                                       | `2.12.1-debian-11-r1`        |
| `client.image.digest`                   | TensorFlow ResNet image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag  | `""`                         |
| `client.image.pullPolicy`               | TensorFlow ResNet image pull policy                                                                                | `IfNotPresent`               |
| `client.image.pullSecrets`              | Specify docker-registry secret names as an array                                                                   | `[]`                         |
| `hostAliases`                           | Deployment pod host aliases                                                                                        | `[]`                         |
| `containerPorts.server`                 | Tensorflow server port                                                                                             | `8500`                       |
| `containerPorts.restApi`                | TensorFlow Serving Rest API Port                                                                                   | `8501`                       |
| `replicaCount`                          | Number of replicas                                                                                                 | `1`                          |
| `podAnnotations`                        | Pod annotations                                                                                                    | `{}`                         |
| `podLabels`                             | Pod labels                                                                                                         | `{}`                         |
| `podAffinityPreset`                     | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                | `""`                         |
| `podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                           | `soft`                       |
| `nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                          | `""`                         |
| `nodeAffinityPreset.key`                | Node label key to match Ignored if `affinity` is set.                                                              | `""`                         |
| `nodeAffinityPreset.values`             | Node label values to match. Ignored if `affinity` is set.                                                          | `[]`                         |
| `affinity`                              | Affinity for pod assignment. Evaluated as a template.                                                              | `{}`                         |
| `nodeSelector`                          | Node labels for pod assignment. Evaluated as a template.                                                           | `{}`                         |
| `tolerations`                           | Tolerations for pod assignment. Evaluated as a template.                                                           | `[]`                         |
| `podSecurityContext.enabled`            | Enabled pod Security Context                                                                                       | `true`                       |
| `podSecurityContext.fsGroup`            | Set pod Security Context fsGroup                                                                                   | `1001`                       |
| `containerSecurityContext.enabled`      | Enabled container Security Context                                                                                 | `true`                       |
| `containerSecurityContext.runAsUser`    | Set container Security Context runAsUser                                                                           | `1001`                       |
| `containerSecurityContext.runAsNonRoot` | Set container Security Context runAsNonRoot                                                                        | `true`                       |
| `command`                               | Override default container command (useful when using custom images)                                               | `[]`                         |
| `args`                                  | Override default container args (useful when using custom images)                                                  | `[]`                         |
| `lifecycleHooks`                        | for the container to automate configuration before or after startup                                                | `{}`                         |
| `extraEnvVars`                          | Array with extra environment variables for the Tensorflow Serving container(s)                                     | `[]`                         |
| `extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env variables for the Tensorflow Serving container(s)                  | `""`                         |
| `extraEnvVarsSecret`                    | Name of existing Secret containing extra env variables for the Tensorflow Serving container(s)                     | `""`                         |
| `extraVolumes`                          | Optionally specify extra list of additional volumes                                                                | `[]`                         |
| `extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Tensorflow Serving container(s)                   | `[]`                         |
| `sidecars`                              | Add additional sidecar containers to the pod                                                                       | `[]`                         |
| `initContainers`                        | Add additional init containers to the pod                                                                          | `[]`                         |
| `updateStrategy.type`                   | Deployment strategy type.                                                                                          | `RollingUpdate`              |
| `priorityClassName`                     | Pod's priorityClassName                                                                                            | `""`                         |
| `schedulerName`                         | Name of the k8s scheduler (other than default)                                                                     | `""`                         |
| `topologySpreadConstraints`             | Topology Spread Constraints for pod assignment                                                                     | `[]`                         |
| `resources.limits`                      | The resources limits for the container                                                                             | `{}`                         |
| `resources.requests`                    | The requested resources for the container                                                                          | `{}`                         |
| `startupProbe.enabled`                  | Enable startupProbe                                                                                                | `false`                      |
| `startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                             | `30`                         |
| `startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                    | `5`                          |
| `startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                   | `5`                          |
| `startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                                 | `6`                          |
| `startupProbe.successThreshold`         | Success threshold for startupProbe                                                                                 | `1`                          |
| `livenessProbe.enabled`                 | Enable livenessProbe                                                                                               | `true`                       |
| `livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                            | `30`                         |
| `livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                   | `5`                          |
| `livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                                  | `5`                          |
| `livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                                | `6`                          |
| `livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                                | `1`                          |
| `readinessProbe.enabled`                | Enable readinessProbe                                                                                              | `true`                       |
| `readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                           | `15`                         |
| `readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                                  | `5`                          |
| `readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                                 | `5`                          |
| `readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                               | `6`                          |
| `readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                               | `1`                          |
| `customStartupProbe`                    | Custom liveness probe                                                                                              | `{}`                         |
| `customLivenessProbe`                   | Custom liveness probe                                                                                              | `{}`                         |
| `customReadinessProbe`                  | Custom readiness probe                                                                                             | `{}`                         |
| `service.type`                          | Kubernetes Service type                                                                                            | `LoadBalancer`               |
| `service.ports.server`                  | TensorFlow Serving server port                                                                                     | `8500`                       |
| `service.ports.restApi`                 | TensorFlow Serving Rest API port                                                                                   | `8501`                       |
| `service.nodePorts.server`              | Kubernetes server node port                                                                                        | `""`                         |
| `service.nodePorts.restApi`             | Kubernetes Rest API node port                                                                                      | `""`                         |
| `service.clusterIP`                     | Service Cluster IP                                                                                                 | `""`                         |
| `service.loadBalancerIP`                | Service Load Balancer IP                                                                                           | `""`                         |
| `service.loadBalancerSourceRanges`      | Service Load Balancer sources                                                                                      | `[]`                         |
| `service.externalTrafficPolicy`         | Service external traffic policy                                                                                    | `Cluster`                    |
| `service.extraPorts`                    | Extra ports to expose (normally used with the `sidecar` value)                                                     | `[]`                         |
| `service.annotations`                   | Additional custom annotations for Service                                                                          | `{}`                         |
| `service.sessionAffinity`               | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                               | `None`                       |
| `service.sessionAffinityConfig`         | Additional settings for the sessionAffinity                                                                        | `{}`                         |
| `metrics.enabled`                       | Enable Prometheus exporter to expose Tensorflow server metrics                                                     | `false`                      |
| `metrics.podAnnotations`                | Prometheus exporter pod annotations                                                                                | `{}`                         |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/tensorflow-resnet --set imagePullPolicy=Always
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/tensorflow-resnet
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling vs Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Set Pod affinity

This chart allows you to set custom Pod affinity using the `affinity` parameter. Find more information about Pod's affinity in the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, you can use any of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 3.3.0

TensorFlow ResNet's version was updated to `2.7.0`. Although this new version [does not include breaking changes](https://github.com/tensorflow/serving/releases/tag/2.7.0), the client [was updated to work with newer TF Model Garden models](https://github.com/tensorflow/serving/commit/bb1428d53abb53fe938ddf9bb8839d4dfe48d291). Older models may need to adapt their signature [to the newer, common one](https://www.tensorflow.org/hub/common_signatures/images).

As a result, the pretrained model served by this Chart was updated to [Imagenet (ILSVRC-2012-CLS) classification with ResNet 50](https://tfhub.dev/tensorflow/resnet_50/classification/1).

### To 3.1.0

This version introduces `bitnami/common`, a [library chart](https://helm.sh/docs/topics/library_charts/#helm) as a dependency. More documentation about this new utility could be found [here](https://github.com/bitnami/charts/tree/main/bitnami/common#bitnami-common-library-chart). Please, make sure that you have updated the chart dependencies before executing any upgrade.

### To 3.0.0

[On November 13, 2020, Helm v2 support formally ended](https://github.com/helm/charts#status-of-the-project). This major version is the result of the required changes applied to the Helm Chart to be able to incorporate the different features added in Helm v3 and to be consistent with the Helm project itself regarding the Helm v2 EOL.

[Learn more about this change and related upgrade considerations](https://docs.bitnami.com/kubernetes/infrastructure/tensorflow-resnet/administration/upgrade-helm3/).

### To 2.0.0

Backwards compatibility is not guaranteed unless you modify the labels used on the chart's deployments.
Use the workaround below to upgrade from versions previous to 2.0.0. The following example assumes that the release name is tensorflow-resnet:

```console
kubectl delete deployment  tensorflow-resnet --cascade=false
helm upgrade tensorflow-resnet oci://registry-1.docker.io/bitnamicharts/tensorflow-resnet
kubectl delete rs "$(kubectl get rs -l app=tensorflow-resnet -o jsonpath='{.items[0].metadata.name}')"
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