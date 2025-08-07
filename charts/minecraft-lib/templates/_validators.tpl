{{/*
Validate required arguments.

Parameters:
- args (dict, optional): A map of argument names to values. Each key is treated as a required argument.
  If a value is empty or unset, an error will be thrown with a message indicating the missing argument.

Example:
{{- include "lib.validators.required" ( dict "args" ( dict
  "name" .Values.name
  "port" .Values.port
) ) -}}
*/}}
{{- define "lib.validators.required" -}}
{{- $msg := "Missing required argument '%s'" -}}

{{- range $k, $v := .args -}}
  {{- $_ := required ( printf $msg $k ) $v -}}
{{- end -}}
{{- end -}}
