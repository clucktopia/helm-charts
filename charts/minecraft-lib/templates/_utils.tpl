{{/*
Render a template.

Parameters:
- tpl (string, required): The template string to render.
- ctx (dict, required): Context variables for template rendering.
- scope (dict, optional): Additional scope to merge with the context.
*/}}
{{- define "lib.utils.renderTpl" -}}
{{- $ctx := .ctx -}}

{{- if .scope -}}
  {{- $ctx = merge ( dict "scope" .scope ) $ctx -}}
{{- end -}}

{{- print ( tpl .tpl $ctx ) -}}
{{- end -}}

{{/*
Render any object as YAML, with optional template evaluation.

Parameters:
- obj (any, required): The object to convert to YAML.
- tpl (bool, optional): If true, render the YAML as a template.
- ctx (dict, optional): Context variables for template rendering.
- scope (dict, optional): Additional scope to merge with the context.
*/}}
{{- define "lib.utils.toYaml" -}}
{{- $yaml := toYaml .obj -}}

{{- if ( eq .tpl true ) -}}
  {{- $yaml = include "lib.utils.renderTpl" ( dict "tpl" $yaml "ctx" .ctx "scope" .scope ) -}}
{{- end -}}

{{- print $yaml -}}
{{- end -}}

{{/*
Render an environment variable entry as YAML.

Parameters:
- key (string, required): The environment variable name.
- value (string, required): The environment variable value.
- tpl (bool, optional): If true, render the value as a template.
- ctx (dict, optional): Context variables for template rendering.
- scope (dict, optional): Additional scope to merge with the context.
*/}}
{{- define "lib.utils.toEnvVar" -}}
{{- if .value -}}
  {{- $value := list ( dict "name" .key "value" .value ) -}}
  {{- $env := include "lib.utils.toYaml" ( dict "obj" $value "tpl" .tpl "ctx" .ctx "scope" .scope ) -}}
  {{- print $env -}}
{{- end -}}
{{- end -}}
