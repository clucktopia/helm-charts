{{- define "minecraft.containers.server" }}
- name: server
  image: {{ .Values.image.repository }}:{{ .Values.image.tag }}
  imagePullPolicy: {{ .Values.image.pullPolicy }}
  {{- if .Values.securityContext }}
  securityContext: {{- toYaml .Values.securityContext | nindent 4 }}
  {{- end }}
  stdin: true
  tty: true
  env:
    {{- include "minecraft.env.container" . | indent 4 }}
    {{- include "minecraft.env.versions" . | indent 4 }}
    {{- include "minecraft.env.properties" . | indent 4 }}
    {{- include "minecraft.env.assets" . | indent 4 }}
    {{- include "minecraft.env.rcon" . | indent 4 }}
    {{- if .Values.env }}
    {{- toYaml .Values.env | nindent 4 }}
    {{- end }}
  {{- if .Values.resources}}
  resources: {{- toYaml .Values.resources | nindent 4 }}
  {{- end}}
  {{- if or ( .Values.lifecycle.preStop ) ( .Values.lifecycle.postStart ) }}
  lifecycle:
    {{- if .Values.lifecycle.preStop }}
    preStop:
      {{- toYaml .Values.lifecycle.preStop | nindent 8 }}
    {{- end }}
    {{- if .Values.lifecycle.postStart }}
    postStart:
      {{- toYaml .Values.lifecycle.postStart | nindent 8 }}
    {{- end }}
  {{- end }}
  {{- if .Values.startupProbe}}
  startupProbe: {{- toYaml .Values.startupProbe | nindent 4 }}
  {{- end }}
  {{- if .Values.livenessProbe}}
  livenessProbe: {{- toYaml .Values.livenessProbe | nindent 4 }}
  {{- end }}
  {{- if .Values.readinessProbe }}
  readinessProbe: {{- toYaml .Values.readinessProbe | nindent 4 }}
  {{- end }}
  ports:
    - containerPort: 25565
      name: minecraft
      protocol: TCP
    {{- if eq ( include "minecraft.common.isRconEnabled" . ) "true" }}
    - containerPort: {{ .Values.rcon.port }}
      name: rcon
      protocol: TCP
    {{- end }}
    {{- if .Values.ports }}
    {{- toYaml .Values.ports | nindent 4 }}
    {{- end }}
  volumeMounts:
    - mountPath: /tmp
      name: tmpdir
    - mountPath: /data
      name: datadir
    {{- if eq ( include "minecraft.common.isBackupEnabled" . ) "true" }}
    - mountPath: /backups
      name: backupdir
    {{- end }}
{{- end }}

{{- define "minecraft.containers.backup" }}
- name: backup
  image: {{ .Values.backup.image.repository }}:{{ .Values.backup.image.tag }}
  imagePullPolicy: {{ .Values.backup.image.pullPolicy }}
  {{- if .Values.backup.resources}}
  resources: {{- toYaml .Values.backup.resources | nindent 4 }}
  {{- end }}
  env:
    {{- include "minecraft.env.backup" . | indent 4 }}
    {{- if .Values.backup.env }}
    {{- toYaml .Values.backup.env | nindent 4 }}
    {{- end }}
  volumeMounts:
    - mountPath: /tmp
      name: tmpdir
    - mountPath: /data
      name: datadir
    - mountPath: /backups
      name: backupdir
    {{- if eq .Values.backup.config.type "rclone" }}
    - mountPath: /config/rclone
      name: rcloneconfig
    {{- end }}
{{- end }}

{{- define "minecraft.containers.metrics" }}
- name: metrics
  image: {{ .Values.metrics.image.repository }}:{{ .Values.metrics.image.tag }}
  imagePullPolicy: {{ .Values.metrics.image.pullPolicy }}
  {{- if .Values.metrics.resources}}
  resources: {{- toYaml .Values.metrics.resources | nindent 4 }}
  {{- end }}
  env:
    {{- include "minecraft.env.metrics" . | indent 4 }}
    {{- if .Values.metrics.env }}
    {{- toYaml .Values.metrics.env | nindent 4 }}
    {{- end }}
  args: ["export-for-prometheus"]
  ports:
    - containerPort: 8080
      name: metrics
      protocol: TCP
{{- end }}
