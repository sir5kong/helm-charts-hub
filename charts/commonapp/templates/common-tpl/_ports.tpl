{{/*
common.ports.firstContainerPort
*/}}
{{- define "common.ports.firstContainerPort" -}}
{{- $ports := .Values.ports | default list -}}
{{- $portsFirstNum := 0 -}}
{{- if ge (len $ports) 1 -}}
  {{- with (index $ports 0) -}}
    {{- if ge (.containerPort | int) 1 -}}
    {{- $portsFirstNum = .containerPort -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $portsFirstNum -}}
{{- end -}}

{{/*
common.container.ports
*/}}
{{- define "common.container.ports" -}}
{{- $ports := .Values.ports | default list -}}
{{- range $ports -}}
  {{- $containerPort := .containerPort | int -}}
  {{- $protocol:= .protocol | default "TCP" -}}
  {{- $defaultPortName := printf "%s-%d" (lower $protocol) $containerPort  -}}
{{- if ge $containerPort 1 }}
- name: {{ .name | default $defaultPortName  }}
  containerPort: {{ $containerPort }}
  protocol: {{ $protocol }}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
common.service.ports
*/}}
{{- define "common.service.ports" -}}
{{- $ports := .Values.ports | default list -}}
{{- range $ports -}}
  {{- $containerPort := .containerPort | int -}}
  {{- $servicePort := .servicePort | default $containerPort -}}
  {{- $protocol:= .protocol | default "TCP" -}}
  {{- $defaultPortName := printf "%s-%d" (lower $protocol) $containerPort  -}}
{{- if ge $containerPort 1 }}
- port: {{ $servicePort }}
  targetPort: {{ $containerPort }}
  protocol: {{ $protocol }}
  name: {{ .name | default $defaultPortName  }}
{{- end -}}
{{- end -}}
{{- end -}}