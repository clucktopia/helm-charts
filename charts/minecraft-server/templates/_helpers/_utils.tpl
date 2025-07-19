{{/*
Render environment variable entry
*/}}
{{- define "minecraft.utils.envMap" }}
{{- if .value }}
- name: {{ .key }}
  value: {{ .value | quote }}
{{- end }}
{{- end }}
