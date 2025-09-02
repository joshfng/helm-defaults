#!/usr/bin/env bash

# Get the default values of a Helm chart in a prettified format

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo "Get the default values for a Helm chart in a prettified format"
  echo ""
  echo "Usage:"
  echo "  helm defaults CHART"
  echo ""
  echo "Examples:"
  echo "  # Get defaults for a chart in a repository"
  echo "  # expects yq to be available on \$PATH"
  echo "  helm defaults stable/nginx-ingress"
  echo ""
  echo "  # Get defaults for a local chart"
  echo "  helm defaults ./my-chart"
  exit 0
fi

if [ -z "$1" ]; then
  echo "Error: CHART is required"
  exit 1
fi

# Get the default values for the chart
helm show values "$1" | yq --prettyPrint --colors --output-format yaml
