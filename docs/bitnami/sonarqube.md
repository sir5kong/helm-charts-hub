<!--- app-name: SonarQube&trade; -->

# SonarQube(TM) packaged by Bitnami

SonarQube(TM) is an open source quality management platform that analyzes and measures code's technical quality. It enables developers to detect code issues, vulnerabilities, and bugs in early stages.

[Overview of SonarQube&trade;](http://www.sonarqube.org)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement. SonarQube is a registered trademark of SonarSource SA.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/sonarqube
```

## Introduction

This chart bootstraps an [SonarQube&trade;](https://github.com/bitnami/containers/tree/main/bitnami/sonarqube) cluster on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/sonarqube
```

The command deploys SonarQube&trade; on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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
| `diagnosticMode.command` | Command to override all containers in the deployment                                    | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                       | `["infinity"]`  |

### SonarQube&trade; Image parameters

| Name                | Description                                                                                                      | Value                 |
| ------------------- | ---------------------------------------------------------------------------------------------------------------- | --------------------- |
| `image.registry`    | SonarQube&trade; image registry                                                                                  | `docker.io`           |
| `image.repository`  | SonarQube&trade; image repository                                                                                | `bitnami/sonarqube`   |
| `image.tag`         | SonarQube&trade; image tag (immutable tags are recommended)                                                      | `10.0.0-debian-11-r7` |
| `image.digest`      | SonarQube&trade; image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `image.pullPolicy`  | SonarQube&trade; image pull policy                                                                               | `IfNotPresent`        |
| `image.pullSecrets` | SonarQube&trade; image pull secrets                                                                              | `[]`                  |
| `image.debug`       | Enable SonarQube&trade; image debug mode                                                                         | `false`               |

### SonarQube&trade; Configuration parameters

| Name                          | Description                                                                                                                                                                 | Value                                                    |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| `sonarqubeUsername`           | SonarQube&trade; username                                                                                                                                                   | `user`                                                   |
| `sonarqubePassword`           | SonarQube&trade; user password                                                                                                                                              | `""`                                                     |
| `provisioningFolder`          | Directory to use for provisioning content to Sonarqube                                                                                                                      | `/bitnami/sonarqube-provisioning`                        |
| `existingSecret`              | Name of existing secret containing SonarQube&trade; credentials                                                                                                             | `""`                                                     |
| `sonarqubeEmail`              | SonarQube&trade; user email                                                                                                                                                 | `user@example.com`                                       |
| `minHeapSize`                 | Minimum heap size for SonarQube&trade;                                                                                                                                      | `1024m`                                                  |
| `maxHeapSize`                 | Maximum heap size for SonarQube&trade;                                                                                                                                      | `2048m`                                                  |
| `jvmOpts`                     | Values to add to SONARQUBE_WEB_JAVA_ADD_OPTS                                                                                                                                | `""`                                                     |
| `jvmCeOpts`                   | Values to add to SONAR_CE_JAVAADDITIONALOPTS                                                                                                                                | `""`                                                     |
| `startTimeout`                | Timeout for the application to start in seconds                                                                                                                             | `150`                                                    |
| `extraProperties`             | List of extra properties to be set in the sonar.properties file (key=value format)                                                                                          | `[]`                                                     |
| `sonarqubeSkipInstall`        | Skip wizard installation                                                                                                                                                    | `false`                                                  |
| `sonarSecurityRealm`          | Set this to LDAP authenticate first against the external sytem. If the external system is not                                                                               | `""`                                                     |
| `sonarAuthenticatorDowncase`  | Set to true when connecting to a LDAP server using a case-insensitive setup.                                                                                                | `""`                                                     |
| `ldap.url`                    | URL of the LDAP server. If you are using ldaps, you should install the server certificate into the Java truststore                                                          | `""`                                                     |
| `ldap.bindDn`                 | The username of an LDAP user to connect (or bind) with. Leave this blank for anonymous access to the LDAP directory.                                                        | `""`                                                     |
| `ldap.bindPassword`           | The password of the user to connect with. Leave this blank for anonymous access to the LDAP directory.                                                                      | `""`                                                     |
| `ldap.authentication`         | Possible values: simple, CRAM-MD5, DIGEST-MD5, GSSAPI. See the tutorial on authentication mechanisms (<http://java.sun.com/products/jndi/tutorial/ldap/security/auth.html>) | `simple`                                                 |
| `ldap.realm`                  | See Digest-MD5 Authentication, CRAM-MD5 Authentication (<http://java.sun.com/products/jndi/tutorial/ldap/security/digest.html>)                                             | `""`                                                     |
| `ldap.contextFactoryClass`    | Context factory class.                                                                                                                                                      | `com.sun.jndi.ldap.LdapCtxFactory`                       |
| `ldap.StartTLS`               | Enable use of StartTLS                                                                                                                                                      | `false`                                                  |
| `ldap.followReferrals`        | Follow referrals or not                                                                                                                                                     | `true`                                                   |
| `ldap.user.baseDn`            | Distinguished Name (DN) of the root node in LDAP from which to search for users.                                                                                            | `""`                                                     |
| `ldap.user.request`           | LDAP user request.                                                                                                                                                          | `(&(objectClass=inetOrgPerson)(uid={login}))`            |
| `ldap.user.realNameAttribute` | in LDAP defining the user’s real name.                                                                                                                                      | `cn`                                                     |
| `ldap.user.emailAttribute`    | Attribute in LDAP defining the user’s email.                                                                                                                                | `mail`                                                   |
| `ldap.group.baseDn`           | Distinguished Name (DN) of the root node in LDAP from which to search for groups.                                                                                           | `""`                                                     |
| `ldap.group.request`          | LDAP group request.                                                                                                                                                         | `(&(objectClass=groupOfUniqueNames)(uniqueMember={dn}))` |
| `ldap.group.idAttribute`      | Attribute in LDAP defining the group’s real name.                                                                                                                           | `cn`                                                     |
| `smtpHost`                    | SMTP server host                                                                                                                                                            | `""`                                                     |
| `smtpPort`                    | SMTP server port                                                                                                                                                            | `""`                                                     |
| `smtpUser`                    | SMTP username                                                                                                                                                               | `""`                                                     |
| `smtpPassword`                | SMTP user password                                                                                                                                                          | `""`                                                     |
| `smtpProtocol`                | SMTP protocol                                                                                                                                                               | `""`                                                     |
| `smtpExistingSecret`          | The name of an existing secret with SMTP credentials                                                                                                                        | `""`                                                     |
| `command`                     | Override default container command (useful when using custom images)                                                                                                        | `[]`                                                     |
| `args`                        | Override default container args (useful when using custom images)                                                                                                           | `[]`                                                     |
| `extraEnvVars`                | Array with extra environment variables to add to SonarQube&trade; nodes                                                                                                     | `[]`                                                     |
| `extraEnvVarsCM`              | Name of existing ConfigMap containing extra env vars for SonarQube&trade; nodes                                                                                             | `""`                                                     |
| `extraEnvVarsSecret`          | Name of existing Secret containing extra env vars for SonarQube&trade; nodes                                                                                                | `""`                                                     |

### SonarQube&trade; deployment parameters

| Name                                    | Description                                                                                    | Value           |
| --------------------------------------- | ---------------------------------------------------------------------------------------------- | --------------- |
| `replicaCount`                          | Number of SonarQube&trade; replicas to deploy                                                  | `1`             |
| `containerPorts.http`                   | SonarQube&trade; HTTP container port                                                           | `9000`          |
| `containerPorts.elastic`                | SonarQube&trade; Elasticsearch container port                                                  | `9001`          |
| `livenessProbe.enabled`                 | Enable livenessProbe on SonarQube&trade; containers                                            | `true`          |
| `livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                        | `100`           |
| `livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                               | `10`            |
| `livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                              | `5`             |
| `livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                            | `6`             |
| `livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                            | `1`             |
| `readinessProbe.enabled`                | Enable readinessProbe on SonarQube&trade; containers                                           | `true`          |
| `readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                       | `100`           |
| `readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                              | `10`            |
| `readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                             | `5`             |
| `readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                           | `6`             |
| `readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                           | `1`             |
| `startupProbe.enabled`                  | Enable startupProbe on SonarQube&trade; containers                                             | `false`         |
| `startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                         | `30`            |
| `startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                | `10`            |
| `startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                               | `1`             |
| `startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                             | `15`            |
| `startupProbe.successThreshold`         | Success threshold for startupProbe                                                             | `1`             |
| `customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                            | `{}`            |
| `customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                           | `{}`            |
| `customStartupProbe`                    | Custom startupProbe that overrides the default one                                             | `{}`            |
| `resources.limits`                      | The resources limits for the SonarQube&trade; containers                                       | `{}`            |
| `resources.requests`                    | The requested resources for the SonarQube&trade; containers                                    | `{}`            |
| `podSecurityContext.enabled`            | Enabled SonarQube&trade; pods' Security Context                                                | `true`          |
| `podSecurityContext.fsGroup`            | Set SonarQube&trade; pod's Security Context fsGroup                                            | `1001`          |
| `containerSecurityContext.enabled`      | Enabled SonarQube&trade; containers' Security Context                                          | `true`          |
| `containerSecurityContext.runAsUser`    | Set SonarQube&trade; containers' Security Context runAsUser                                    | `1001`          |
| `containerSecurityContext.runAsNonRoot` | Set SonarQube&trade; containers' Security Context runAsNonRoot                                 | `true`          |
| `hostAliases`                           | SonarQube&trade; pods host aliases                                                             | `[]`            |
| `podLabels`                             | Extra labels for SonarQube&trade; pods                                                         | `{}`            |
| `podAnnotations`                        | Annotations for SonarQube&trade; pods                                                          | `{}`            |
| `podAffinityPreset`                     | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`            | `""`            |
| `podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `soft`          |
| `nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`      | `""`            |
| `nodeAffinityPreset.key`                | Node label key to match. Ignored if `affinity` is set                                          | `""`            |
| `nodeAffinityPreset.values`             | Node label values to match. Ignored if `affinity` is set                                       | `[]`            |
| `affinity`                              | Affinity for SonarQube&trade; pods assignment                                                  | `{}`            |
| `nodeSelector`                          | Node labels for SonarQube&trade; pods assignment                                               | `{}`            |
| `tolerations`                           | Tolerations for SonarQube&trade; pods assignment                                               | `[]`            |
| `updateStrategy.type`                   | SonarQube&trade; statefulset strategy type                                                     | `RollingUpdate` |
| `priorityClassName`                     | SonarQube&trade; pods' priorityClassName                                                       | `""`            |
| `schedulerName`                         | Name of the k8s scheduler (other than default) for SonarQube&trade; pods                       | `""`            |
| `lifecycleHooks`                        | for the SonarQube&trade; container(s) to automate configuration before or after startup        | `{}`            |
| `extraVolumes`                          | Optionally specify extra list of additional volumes for the SonarQube&trade; pod(s)            | `[]`            |
| `extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the SonarQube&trade; container(s) | `[]`            |
| `sidecars`                              | Add additional sidecar containers to the SonarQube&trade; pod(s)                               | `[]`            |
| `initContainers`                        | Add additional init containers to the SonarQube&trade; pod(s)                                  | `[]`            |

### Traffic Exposure Parameters

| Name                               | Description                                                                                                                      | Value                    |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.type`                     | SonarQube&trade; service type                                                                                                    | `LoadBalancer`           |
| `service.ports.http`               | SonarQube&trade; service HTTP port                                                                                               | `80`                     |
| `service.ports.elastic`            | SonarQube&trade; service ElasticSearch port                                                                                      | `9001`                   |
| `service.nodePorts.http`           | Node port for HTTP                                                                                                               | `""`                     |
| `service.nodePorts.elastic`        | Node port for ElasticSearch                                                                                                      | `""`                     |
| `service.clusterIP`                | SonarQube&trade; service Cluster IP                                                                                              | `""`                     |
| `service.loadBalancerIP`           | SonarQube&trade; service Load Balancer IP                                                                                        | `""`                     |
| `service.loadBalancerSourceRanges` | SonarQube&trade; service Load Balancer sources                                                                                   | `[]`                     |
| `service.externalTrafficPolicy`    | SonarQube&trade; service external traffic policy                                                                                 | `Cluster`                |
| `service.annotations`              | Additional custom annotations for SonarQube&trade; service                                                                       | `{}`                     |
| `service.extraPorts`               | Extra ports to expose in SonarQube&trade; service (normally used with the `sidecars` value)                                      | `[]`                     |
| `service.sessionAffinity`          | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                             | `None`                   |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `ingress.enabled`                  | Enable ingress record generation for SonarQube&trade;                                                                            | `false`                  |
| `ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `ingress.hostname`                 | Default host for the ingress record                                                                                              | `sonarqube.local`        |
| `ingress.path`                     | Default path for the ingress record                                                                                              | `/`                      |
| `ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.tls`                      | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                    | `false`                  |
| `ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                     |
| `ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### SonarQube caCerts provisioning parameters

| Name                                         | Description                                                                                                   | Value                   |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `caCerts.enabled`                            | Enable the use of caCerts                                                                                     | `false`                 |
| `caCerts.image.registry`                     | Bitnami Shell image registry                                                                                  | `docker.io`             |
| `caCerts.image.repository`                   | Bitnami Shell image repository                                                                                | `bitnami/bitnami-shell` |
| `caCerts.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                                      | `11-debian-11-r118`     |
| `caCerts.image.digest`                       | Bitnami Shell image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `caCerts.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                               | `IfNotPresent`          |
| `caCerts.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                              | `[]`                    |
| `caCerts.secret`                             | Name of the secret containing the certificates                                                                | `ca-certs-secret`       |
| `caCerts.resources.limits`                   | The resources limits for the init container                                                                   | `{}`                    |
| `caCerts.resources.requests`                 | The requested resources for the init container                                                                | `{}`                    |
| `caCerts.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                               | `0`                     |

### SonarQube plugin provisioning parameters

| Name                                         | Description                                                                                                   | Value                   |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `plugins.install`                            | List of plugin URLS to download and install                                                                   | `[]`                    |
| `plugins.netrcCreds`                         | .netrc secret file with a key "netrc" to use basic auth while downloading plugins                             | `""`                    |
| `plugins.noCheckCertificate`                 | Set to true to not validate the server's certificate to download plugin                                       | `true`                  |
| `plugins.image.registry`                     | Bitnami Shell image registry                                                                                  | `docker.io`             |
| `plugins.image.repository`                   | Bitnami Shell image repository                                                                                | `bitnami/bitnami-shell` |
| `plugins.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                                      | `11-debian-11-r118`     |
| `plugins.image.digest`                       | Bitnami Shell image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `plugins.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                               | `IfNotPresent`          |
| `plugins.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                              | `[]`                    |
| `plugins.resources.limits`                   | The resources limits for the init container                                                                   | `{}`                    |
| `plugins.resources.requests`                 | The requested resources for the init container                                                                | `{}`                    |
| `plugins.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                               | `0`                     |

### Persistence Parameters

| Name                                                   | Description                                                                                                   | Value                   |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `persistence.enabled`                                  | Enable persistence using Persistent Volume Claims                                                             | `false`                 |
| `persistence.storageClass`                             | Persistent Volume storage class                                                                               | `""`                    |
| `persistence.accessModes`                              | Persistent Volume access modes                                                                                | `[]`                    |
| `persistence.size`                                     | Persistent Volume size                                                                                        | `10Gi`                  |
| `persistence.dataSource`                               | Custom PVC data source                                                                                        | `{}`                    |
| `persistence.existingClaim`                            | The name of an existing PVC to use for persistence                                                            | `""`                    |
| `persistence.annotations`                              | Persistent Volume Claim annotations                                                                           | `{}`                    |
| `volumePermissions.enabled`                            | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup`               | `false`                 |
| `volumePermissions.image.registry`                     | Bitnami Shell image registry                                                                                  | `docker.io`             |
| `volumePermissions.image.repository`                   | Bitnami Shell image repository                                                                                | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                                      | `11-debian-11-r118`     |
| `volumePermissions.image.digest`                       | Bitnami Shell image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `volumePermissions.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                               | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                              | `[]`                    |
| `volumePermissions.resources.limits`                   | The resources limits for the init container                                                                   | `{}`                    |
| `volumePermissions.resources.requests`                 | The requested resources for the init container                                                                | `{}`                    |
| `volumePermissions.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                               | `0`                     |

### Sysctl Image parameters

| Name                        | Description                                                                                                   | Value                   |
| --------------------------- | ------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `sysctl.enabled`            | Enable kernel settings modifier image                                                                         | `true`                  |
| `sysctl.image.registry`     | Bitnami Shell image registry                                                                                  | `docker.io`             |
| `sysctl.image.repository`   | Bitnami Shell image repository                                                                                | `bitnami/bitnami-shell` |
| `sysctl.image.tag`          | Bitnami Shell image tag (immutable tags are recommended)                                                      | `11-debian-11-r118`     |
| `sysctl.image.digest`       | Bitnami Shell image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `sysctl.image.pullPolicy`   | Bitnami Shell image pull policy                                                                               | `IfNotPresent`          |
| `sysctl.image.pullSecrets`  | Bitnami Shell image pull secrets                                                                              | `[]`                    |
| `sysctl.resources.limits`   | The resources limits for the init container                                                                   | `{}`                    |
| `sysctl.resources.requests` | The requested resources for the init container                                                                | `{}`                    |

### Other Parameters

| Name                                          | Description                                                                                                         | Value   |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------- |
| `rbac.create`                                 | Specifies whether RBAC resources should be created                                                                  | `false` |
| `serviceAccount.create`                       | Specifies whether a ServiceAccount should be created                                                                | `true`  |
| `serviceAccount.name`                         | Name of the service account to use. If not set and create is true, a name is generated using the fullname template. | `""`    |
| `serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account                                                      | `true`  |
| `serviceAccount.annotations`                  | Annotations for service account. Evaluated as a template. Only used if `create` is `true`.                          | `{}`    |
| `autoscaling.enabled`                         | Enable Horizontal POD autoscaling for SonarQube&trade;                                                              | `false` |
| `autoscaling.minReplicas`                     | Minimum number of SonarQube&trade; replicas                                                                         | `1`     |
| `autoscaling.maxReplicas`                     | Maximum number of SonarQube&trade; replicas                                                                         | `11`    |
| `autoscaling.targetCPU`                       | Target CPU utilization percentage                                                                                   | `50`    |
| `autoscaling.targetMemory`                    | Target Memory utilization percentage                                                                                | `50`    |

### Metrics parameters

| Name                                                | Description                                                                                                  | Value                  |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ---------------------- |
| `metrics.jmx.enabled`                               | Whether or not to expose JMX metrics to Prometheus                                                           | `false`                |
| `metrics.jmx.image.registry`                        | JMX exporter image registry                                                                                  | `docker.io`            |
| `metrics.jmx.image.repository`                      | JMX exporter image repository                                                                                | `bitnami/jmx-exporter` |
| `metrics.jmx.image.tag`                             | JMX exporter image tag (immutable tags are recommended)                                                      | `0.18.0-debian-11-r22` |
| `metrics.jmx.image.digest`                          | JMX exporter image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                   |
| `metrics.jmx.image.pullPolicy`                      | JMX exporter image pull policy                                                                               | `IfNotPresent`         |
| `metrics.jmx.image.pullSecrets`                     | Specify docker-registry secret names as an array                                                             | `[]`                   |
| `metrics.jmx.containerPorts.metrics`                | JMX Exporter metrics container port                                                                          | `10445`                |
| `metrics.jmx.resources.limits`                      | The resources limits for the init container                                                                  | `{}`                   |
| `metrics.jmx.resources.requests`                    | The requested resources for the init container                                                               | `{}`                   |
| `metrics.jmx.containerSecurityContext.enabled`      | Enabled JMX Exporter containers' Security Context                                                            | `true`                 |
| `metrics.jmx.containerSecurityContext.runAsUser`    | Set JMX Exporter containers' Security Context runAsUser                                                      | `1001`                 |
| `metrics.jmx.containerSecurityContext.runAsNonRoot` | Set JMX Exporter containers' Security Context runAsNonRoot                                                   | `true`                 |
| `metrics.jmx.whitelistObjectNames`                  | Allows setting which JMX objects you want to expose to via JMX stats to JMX Exporter                         | `[]`                   |
| `metrics.jmx.configuration`                         | Configuration file for JMX exporter                                                                          | `""`                   |
| `metrics.jmx.service.ports.metrics`                 | JMX Exporter Prometheus port                                                                                 | `10443`                |
| `metrics.jmx.service.annotations`                   | Annotations for the JMX Exporter Prometheus metrics service                                                  | `{}`                   |
| `metrics.serviceMonitor.enabled`                    | if `true`, creates a Prometheus Operator ServiceMonitor (requires `metrics.jmx.enabled` to be `true`)        | `false`                |
| `metrics.serviceMonitor.namespace`                  | Namespace in which Prometheus is running                                                                     | `""`                   |
| `metrics.serviceMonitor.labels`                     | Extra labels for the ServiceMonitor                                                                          | `{}`                   |
| `metrics.serviceMonitor.jobLabel`                   | The name of the label on the target service to use as the job name in Prometheus                             | `""`                   |
| `metrics.serviceMonitor.interval`                   | How frequently to scrape metrics                                                                             | `""`                   |
| `metrics.serviceMonitor.scrapeTimeout`              | Timeout after which the scrape is ended                                                                      | `""`                   |
| `metrics.serviceMonitor.metricRelabelings`          | Specify additional relabeling of metrics                                                                     | `[]`                   |
| `metrics.serviceMonitor.relabelings`                | Specify general relabeling                                                                                   | `[]`                   |
| `metrics.serviceMonitor.selector`                   | Prometheus instance selector labels                                                                          | `{}`                   |

### PostgreSQL subchart settings

| Name                                           | Description                                                                        | Value               |
| ---------------------------------------------- | ---------------------------------------------------------------------------------- | ------------------- |
| `postgresql.enabled`                           | Deploy PostgreSQL subchart                                                         | `true`              |
| `postgresql.nameOverride`                      | Override name of the PostgreSQL chart                                              | `""`                |
| `postgresql.auth.existingSecret`               | Existing secret containing the password of the PostgreSQL chart                    | `""`                |
| `postgresql.auth.password`                     | Password for the postgres user of the PostgreSQL chart (auto-generated if not set) | `""`                |
| `postgresql.auth.username`                     | Username to create when deploying the PostgreSQL chart                             | `bn_sonarqube`      |
| `postgresql.auth.database`                     | Database to create when deploying the PostgreSQL chart                             | `bitnami_sonarqube` |
| `postgresql.primary.service.ports.postgresql`  | PostgreSQL service port                                                            | `5432`              |
| `postgresql.primary.persistence.enabled`       | Enable PostgreSQL Primary data persistence using PVC                               | `true`              |
| `postgresql.primary.persistence.existingClaim` | Name of an existing PVC to use                                                     | `""`                |
| `postgresql.primary.persistence.storageClass`  | PVC Storage Class for PostgreSQL Primary data volume                               | `""`                |
| `postgresql.primary.persistence.accessMode`    | PVC Access Mode for PostgreSQL volume                                              | `ReadWriteOnce`     |
| `postgresql.primary.persistence.size`          | PVC Storage Request for PostgreSQL volume                                          | `8Gi`               |

### External Database settings

| Name                              | Description                                                                                                     | Value       |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------- | ----------- |
| `externalDatabase.host`           | Host of an external PostgreSQL instance to connect (only if postgresql.enabled=false)                           | `""`        |
| `externalDatabase.user`           | User of an external PostgreSQL instance to connect (only if postgresql.enabled=false)                           | `postgres`  |
| `externalDatabase.password`       | Password of an external PostgreSQL instance to connect (only if postgresql.enabled=false)                       | `""`        |
| `externalDatabase.existingSecret` | Secret containing the password of an external PostgreSQL instance to connect (only if postgresql.enabled=false) | `""`        |
| `externalDatabase.database`       | Database inside an external PostgreSQL to connect (only if postgresql.enabled=false)                            | `sonarqube` |
| `externalDatabase.port`           | Port of an external PostgreSQL to connect (only if postgresql.enabled=false)                                    | `5432`      |

The above parameters map to the env variables defined in [bitnami/sonarqube](https://github.com/bitnami/containers/tree/main/bitnami/sonarqube). For more information please refer to the [bitnami/sonarqube](https://github.com/bitnami/containers/tree/main/bitnami/sonarqube) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set sonarqubeUsername=admin \
  --set sonarqubePassword=password \
  --set postgresql.auth.password=secretpassword \
    oci://registry-1.docker.io/bitnamicharts/sonarqube
```

The above command sets the sonarqube administrator account username and password to `admin` and `password` respectively. Additionally, it sets the PostgreSQL `postgres` user password to `secretpassword`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/sonarqube
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Default kernel settings

Currently, SonarQube&trade; requires some changes in the kernel of the host machine to work as expected. If those values are not set in the underlying operating system, the SonarQube&trade; containers fail to boot with ERROR messages. More information about these requirements can be found in the links below:

- [File Descriptor requirements](https://www.elastic.co/guide/en/elasticsearch/reference/current/file-descriptors.html)
- [Virtual memory requirements](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)

This chart uses a **privileged** initContainer to change those settings in the Kernel by running: `sysctl -w vm.max_map_count=262144 && sysctl -w fs.file-max=65536`. You can disable the initContainer using the `sysctl.enabled=false` parameter.

### External database support

You may want to have SonarQube&trade; connect to an external database rather than installing one inside your cluster. Typical reasons for this are to use a managed database service, or to share a common database server for all your applications. To achieve this, set the `postgresql.enabled` parameter to `false` and specify the credentials for the external database using the `externalDatabase.*` parameters.

Refer to the [chart documentation on using an external database](https://docs.bitnami.com/kubernetes/apps/sonarqube/configuration/use-external-database) for more details and an example.

### Ingress

This chart provides support for Ingress resources. If you have an ingress controller installed on your cluster, such as [nginx-ingress-controller](https://github.com/bitnami/charts/tree/main/bitnami/nginx-ingress-controller) or [contour](https://github.com/bitnami/charts/tree/main/bitnami/contour) you can utilize the ingress controller to serve your application.

To enable Ingress integration, set `ingress.enabled` to `true`. The `ingress.hostname` property can be used to set the host name. The `ingress.tls` parameter can be used to add the TLS configuration for this host. It is also possible to have more than one host, with a separate TLS configuration for each host. [Learn more about configuring and using Ingress](https://docs.bitnami.com/kubernetes/apps/sonarqube/configuration/configure-ingress/).

### TLS secrets

The chart also facilitates the creation of TLS secrets for use with the Ingress controller, with different options for certificate management. [Learn more about TLS secrets](https://docs.bitnami.com/kubernetes/apps/sonarqube/administration/enable-tls-ingress/).

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property.

```yaml
sonarqube:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values.

### Sidecars

If additional containers are needed in the same pod as SonarQube&trade; (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter. If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/apps/sonarqube/configuration/configure-sidecar-init-containers/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

## Persistence

The [Bitnami SonarQube&trade;](https://github.com/bitnami/containers/tree/main/bitnami/sonarqube) image stores the SonarQube&trade; data and configurations at the `/bitnami/sonarqube` path of the container. Persistent Volume Claims are used to keep the data across deployments.

### Adjust permissions of persistent volume mountpoint

As the image run as non-root by default, it is necessary to adjust the ownership of the persistent volume so that the container can write data into it.

By default, the chart is configured to use Kubernetes Security Context to automatically change the ownership of the volume. However, this feature does not work in all Kubernetes distributions.

As an alternative, this chart supports using an initContainer to change the ownership of the volume before mounting it in the final destination. You can enable this initContainer by setting `volumePermissions.enabled` to `true`.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 2.0.0

This major updates the PostgreSQL subchart to its newest major, 12.0.0. [Here](https://github.com/bitnami/charts/tree/master/bitnami/postgresql#to-1200) you can find more information about the changes introduced in that version.

### To any previous version

Refer to the [chart documentation for more information about how to upgrade from previous releases](https://docs.bitnami.com/kubernetes/apps/sonarqube/administration/upgrade/).

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