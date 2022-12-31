{{- define "module.name" -}}
    {{ .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "module.chart" -}}
    {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "module.selectorLabels" -}}
app.kubernetes.io/name: {{ include "module.name" . }}
app.kubernetes.io/instance: {{ .Values.name }}
{{- end -}}

{{- define "module.labels" -}}
helm.sh/chart: {{ include "module.chart" . }}
{{ include "module.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


