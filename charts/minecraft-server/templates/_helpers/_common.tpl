{{/*
Expand the name of the chart.
*/}}
{{- define "minecraft.common.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "minecraft.common.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "minecraft.common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "minecraft.common.labels" -}}
helm.sh/chart: {{ include "minecraft.common.chart" . }}
{{ include "minecraft.common.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "minecraft.common.selectorLabels" -}}
app.kubernetes.io/instance: {{ include "minecraft.common.fullname" . | quote }}
app.kubernetes.io/name: {{ include "minecraft.common.name" . | quote }}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "minecraft.common.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "minecraft.common.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Check if the rcon is enabled
*/}}
{{- define "minecraft.common.isRconEnabled" -}}
{{ eq .Values.rcon.enabled "true" }}
{{- end }}

{{/*
Create the name of the rcon service to use
*/}}
{{- define "minecraft.common.rconName" -}}
{{- printf "%s-rcon" ( include "minecraft.common.fullname" . ) }}
{{- end }}

{{/*
Create the name of the rcon secret to use
*/}}
{{- define "minecraft.common.rconSecretName" -}}
{{- $secretName := .Values.rcon.existingSecret }}
{{- default ( include "minecraft.common.rconName" . ) $secretName }}
{{- end }}

{{/*
Check if the backup is enabled
*/}}
{{- define "minecraft.common.isBackupEnabled" -}}
{{ and ( eq .Values.backup.enabled "true" ) ( eq ( include "minecraft.common.isRconEnabled" . ) "true" ) }}
{{- end }}

{{/*
Create the key of the rcon secret to use
*/}}
{{- define "minecraft.common.rconSecretKey" -}}
{{- $secretKey := .Values.rcon.existingSecretKey }}
{{- default "rcon-password" $secretKey }}
{{- end }}

{{/*
Create the name of the rclone secret to use
*/}}
{{- define "minecraft.common.rcloneSecretName" -}}
{{- $secretName := .Values.backup.config.rcloneExistingSecret }}
{{- default ( printf "%s-rclone" ( include "minecraft.common.fullname" . ) ) $secretName }}
{{- end }}

{{/*
Create the key of the rclone secret to use
*/}}
{{- define "minecraft.common.rcloneSecretKey" -}}
{{- $secretKey := .Values.backup.config.rcloneExistingSecretKey }}
{{- default "rclone-conf" $secretKey }}
{{- end }}

{{/*
Create the name of the restic secret to use
*/}}
{{- define "minecraft.common.resticSecretName" -}}
{{- $secretName := .Values.backup.config.resticExistingSecret }}
{{- default ( printf "%s-restic" ( include "minecraft.common.fullname" . ) ) $secretName }}
{{- end }}

{{/*
Create the key of the restic secret to use
*/}}
{{- define "minecraft.common.resticSecretKey" -}}
{{- $secretKey := .Values.backup.config.resticExistingSecretKey }}
{{- default "restic-password" $secretKey }}
{{- end }}

{{/*
Create the name of the curseforge secret to use
*/}}
{{- define "minecraft.common.curseforgeSecretName" -}}
{{- $secretName := .Values.server.assets.source.curseforgeExistingSecret }}
{{- default ( printf "%s-curseforge" ( include "minecraft.common.fullname" . ) ) $secretName }}
{{- end }}

{{/*
Create the key of the curseforge secret to use
*/}}
{{- define "minecraft.common.curseforgeSecretKey" -}}
{{- $secretKey := .Values.server.assets.source.curseforgeExistingSecretKey }}
{{- default "api-key" $secretKey }}
{{- end }}

{{/*
Create the name of the metrics service to use
*/}}
{{- define "minecraft.common.metricsName" -}}
{{- printf "%s-metrics" ( include "minecraft.common.fullname" . ) }}
{{- end }}
