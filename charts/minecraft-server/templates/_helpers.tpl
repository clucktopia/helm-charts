{{- define "minecraft-server.createCurseforgeSecret" -}}
{{- $secretName := include "lib.secrets.name" ( dict "suffix" "curseforge" "ctx" . ) -}}

{{- and
  ( not ( empty .Values.server.curseforgeApiKey ) )
  ( empty .Values.server.curseforgeExistingSecret )
  ( empty ( lookup "v1" "Secret" .Release.Namespace $secretName ) )
-}}
{{- end -}}

{{- define "minecraft-server.pathCurseforgeSecret" -}}
{{- printf "%s/%s"
  "/secrets/curseforge"
  ( include "lib.secrets.key" ( dict "key" "api-key" "existingSecret" .Values.server.curseforgeExistingSecret ) )
-}}
{{- end -}}

{{- define "minecraft-server.createRconSecret" -}}
{{- $secretName := include "lib.secrets.name" ( dict "suffix" "rcon" "ctx" . ) -}}

{{- and
  ( .Values.rcon.enabled )
  ( empty .Values.rcon.existingSecret )
  ( empty ( lookup "v1" "Secret" .Release.Namespace $secretName ) )
-}}
{{- end -}}

{{- define "minecraft-server.createRcloneSecret" -}}
{{- $secretName := include "lib.secrets.name" ( dict "suffix" "rclone" "ctx" . ) -}}

{{- and
  ( .Values.backup.enabled )
  ( eq .Values.backup.config.backupMethod "rclone" )
  ( not ( empty .Values.backup.config.rcloneConfig ) )
  ( empty .Values.backup.config.rcloneExistingSecret )
  ( empty ( lookup "v1" "Secret" .Release.Namespace $secretName ) )
-}}
{{- end -}}

{{- define "minecraft-server.createResticSecret" -}}
{{- $secretName := include "lib.secrets.name" ( dict "suffix" "restic" "ctx" . ) -}}

{{- and
  ( .Values.backup.enabled )
  ( eq .Values.backup.config.backupMethod "restic" )
  ( not ( empty .Values.backup.config.resticPassword ) )
  ( empty .Values.backup.config.resticExistingSecret )
  ( empty ( lookup "v1" "Secret" .Release.Namespace $secretName ) )
-}}
{{- end -}}
