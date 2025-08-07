{{/*
Normalize the given string replacing:
- "." to "-"

Parameters:
- str (string, required): A reference to an existing secret defined in values.yaml. If provided, its name will be used.
*/}}
{{- define "lib.strings.normalize" -}}
{{- include "lib.validators.required" ( dict "args" ( dict
  "str" .str
) ) -}}

{{- .str
  | replace "." "-"
  | replace "/" "-"
-}}
{{- end -}}
