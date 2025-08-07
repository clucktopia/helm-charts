{{/*
Render a template.

Parameters:
- tpl (string, required): The template string to render.
- ctx (dict, required): Context variables for template rendering.
- scope (dict, optional): Additional scope to merge with the context.
*/}}
{{- define "lib.utils.renderTpl" -}}
{{- include "lib.validators.required" ( dict "args" ( dict
  "tpl" .tpl
  "ctx" .ctx
) ) -}}
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
{{- include "lib.validators.required" ( dict "args" ( dict
  "obj" .obj
) ) -}}
{{- $yaml := toYaml .obj -}}

{{- if ( eq .tpl true ) -}}
  {{- $yaml = include "lib.utils.renderTpl" ( dict "tpl" $yaml "ctx" .ctx "scope" .scope ) -}}
{{- end -}}

{{- print $yaml -}}
{{- end -}}
