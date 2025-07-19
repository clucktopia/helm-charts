{{/*
Render environment variable entry
*/}}
{{- define "lib.utils.envMap" }}
{{- if .value }}
- name: {{ .key }}
  value: {{ .value | quote }}
{{- end }}
{{- end }}
