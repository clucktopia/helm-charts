{{/*
Common labels.
*/}}
{{- define "lib.labels.common" -}}
helm.sh/chart: {{ include "lib.names.chart" . | quote }}
app.kubernetes.io/instance: {{ include "lib.names.fullname" . | quote }}
app.kubernetes.io/name: {{ include "lib.names.name" . | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- if .Chart.AppVersion -}}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end -}}
{{- end -}}
