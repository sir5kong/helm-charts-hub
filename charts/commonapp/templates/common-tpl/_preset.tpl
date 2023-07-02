{{/*
common.topologySpreadConstraintsPreset
*/}}
{{- define "common.topologySpreadConstraintsPreset" -}}
{{- $preset := .Values.topologySpreadConstraintsPreset | default dict -}}
- maxSkew: {{ $preset.maxSkew | default 1 }}
  topologyKey: {{ $preset.topologyKey | default "kubernetes.io/hostname" }}
  whenUnsatisfiable: {{ $preset.whenUnsatisfiable | default "ScheduleAnyway" }}
  labelSelector:
    matchLabels:
      {{- include "common.selectorLabels" . | nindent 8 }}
{{- end -}}

{{/*
common.topologySpreadConstraints
*/}}
{{- define "common.topologySpreadConstraints" -}}
{{- $presetEnabled := .Values.topologySpreadConstraintsEnabled -}}
{{- if and .Values.topologySpreadConstraints $presetEnabled -}}
{{- toYaml .Values.topologySpreadConstraints }}
{{ include "common.topologySpreadConstraintsPreset" . }}
{{- else if .Values.topologySpreadConstraints -}}
{{- toYaml .Values.topologySpreadConstraints }}
{{- else if $presetEnabled -}}
{{- include "common.topologySpreadConstraintsPreset" . }}
{{- else }}[]
{{- end -}}
{{- end -}}