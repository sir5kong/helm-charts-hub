{{- define "kafka.initContainer.checkClusterId" -}}
- name: check-clusterid
  image: {{ include "kafka.kafkaImage" . | quote }}
  {{- if .Values.image.pullPolicy }}
  imagePullPolicy: {{ .Values.image.pullPolicy | quote }}
  {{- end }}
  env:
  - name: KAFKA_CLUSTER_ID
    valueFrom:
      secretKeyRef:
        name: {{ include "kafka.clusterId.SecretName" . }}
        key: clusterId
  command: ["/bin/bash"]
  args:
    - -c
    - |
      if [[ -f "$KAFKA_CFG_LOG_DIR/meta.properties" ]]; then
        meta_clusterid=$(grep -E '^cluster\.id' meta.properties | awk -F '=' '{print $2}')
        if [[ "$meta_clusterid" != "$KAFKA_CLUSTER_ID" ]]; then
          cat "$KAFKA_CFG_LOG_DIR/meta.properties"
          echo "[ERROR] CLUSTER_ID Exception, \
            The CLUSTER_ID currently deployed is $KAFKA_CLUSTER_ID, \
            and The stored CLUSTER_ID in KAFKA_CFG_LOG_DIR is $meta_clusterid"
          echo "[ERROR] CLUSTER_ID Exception, \
            Use \"--set clusterId=$meta_clusterid\" to continue helm deploy, \
            Or clean up KAFKA_CFG_LOG_DIR and deploy a new cluster. \
            See https://github.com/sir5kong/kafka-docker"
          exit "500"
        fi
      fi
  volumeMounts:
  - mountPath: /opt/kafka/data
    name: data
    readOnly: true
{{- end }}
