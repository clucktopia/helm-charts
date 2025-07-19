{{/*
Render environment variable entry
*/}}
{{- define "minecraft-proxy.utils.envMap" }}
{{- if .value }}
- name: {{ .key }}
  value: {{ .value | quote }}
{{- end }}
{{- end }}
