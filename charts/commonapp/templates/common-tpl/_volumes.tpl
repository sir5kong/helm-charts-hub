{{/*
common.volumes
*/}}
{{- define "common.configMapVolumeName" -}}
{{- default (include "common.fullname" .) .Values.configMapMounts.extraConfigMapName -}}
{{- end -}}

{{/*
common.configMapVolumes
*/}}
{{- define "common.configMapVolumes" -}}
{{- $cm := .Values.configMapMounts | default dict -}}
- configMap:
    name: {{ include "common.configMapVolumeName" . }}
  {{- with $cm.items }}
    items:
    {{- range . }}
    - key: {{ .key }}
      path: {{ .path }}
    {{- end }}
  {{- end }}
  name: {{ include "common.configMapVolumeName" . }}
{{- end -}}

{{/*
common.volumes
*/}}
{{- define "common.volumes" -}}
{{- $cm := .Values.configMapMounts | default dict -}}
{{- if and .Values.extraVolumes $cm.enabled }}
{{- toYaml .Values.extraVolumes }}
{{ include "common.configMapVolumes" . }}
{{- else if .Values.extraVolumes }}
{{- toYaml .Values.extraVolumes }}
{{- else if $cm.enabled}}
{{- include "common.configMapVolumes" . }}
{{- else }}[]
{{- end }}
{{- end -}}


{{/*
common.configMapVolumeMounts
*/}}
{{- define "common.configMapVolumeMounts" -}}
{{- $cm := .Values.configMapMounts | default dict -}}
- name: {{ include "common.configMapVolumeName" . }}
  mountPath: {{ $cm.mountPath }}
  {{- if $cm.subPath }}
  subPath: {{ $cm.subPath }}
  {{- end }}
{{- end -}}

{{/*
common.volumeMounts
*/}}
{{- define "common.volumeMounts" -}}
{{- $cm := .Values.configMapMounts | default dict -}}
{{- if and .Values.extraVolumeMounts $cm.enabled }}
{{- toYaml .Values.extraVolumeMounts }}
{{ include "common.configMapVolumeMounts" . }}
{{- else if .Values.extraVolumeMounts }}
{{- toYaml .Values.extraVolumeMounts }}
{{- else if $cm.enabled}}
{{- include "common.configMapVolumeMounts" . }}
{{- else }}[]
{{- end }}
{{- end -}}