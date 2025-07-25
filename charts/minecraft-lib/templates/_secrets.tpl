{{/*
Generate a name for a secret.

Parameters:
- existingSecret (dict, optional): A reference to an existing secret defined in values.yaml. If provided, its name will be used.
- suffix (string, optional): A suffix to append to the generated name.
- ctx (dict, required): The context used to generate the base name (usually passed to `lib.names.name`).
*/}}
{{- define "lib.secrets.name" -}}
{{- $name := ( include "lib.names.name" .ctx ) -}}

{{- if .suffix -}}
{{- $name = printf "%s-%s" $name .suffix | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- with .existingSecret -}}
{{- $name = .name -}}
{{- end -}}

{{- printf "%s" $name -}}
{{- end -}}

{{/*
Generate a key for a secret.

Parameters:
- existingSecret (dict, optional): A reference to an existing secret defined in values.yaml. If provided, the key will be resolved using its keyMapping.
- key (string, required): The base key to use, or the lookup key when keyMapping is available.
*/}}
{{- define "lib.secrets.key" -}}
{{- $key := .key -}}

{{- with .existingSecret -}}
{{- $key = index .keyMapping $key -}}
{{- end -}}

{{- printf "%s" $key -}}
{{- end -}}
