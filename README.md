# helm-defaults

A Helm plugin that displays chart default values in a clean, formatted output.

## Overview

`helm-defaults` enhances the standard `helm show values` command by providing prettified YAML output using `yq`, making it easier to read and understand chart default values.

## Features

- **Pretty-printed YAML output** using `yq`
- **Fast tab completion** with intelligent caching
- **Chart discovery** from all configured repositories
- **Local chart support** for development workflows
- **Smart caching** in `~/.cache` or `/tmp` fallback

## Requirements

- [Helm](https://helm.sh/) v3.x
- [yq](https://github.com/mikefarah/yq) v4.x (for YAML formatting)

Install yq:

```bash
# macOS
brew install yq

# Linux
sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
sudo chmod +x /usr/local/bin/yq
```

## Installation

### Install from GitHub

```bash
helm plugin install https://github.com/joshfng/helm-defaults
```

### Install from local directory

```bash
helm plugin install .
```

## Usage

### Basic Usage

```bash
# Show default values for a chart
helm defaults traefik/traefik

# Show defaults for a local chart
helm defaults ./my-chart

# Get help
helm defaults --help
```

### Tab Completion

The plugin supports intelligent tab completion:

```bash
# Complete chart names from all repositories
helm defaults <TAB>

# Filter by prefix
helm defaults traefik<TAB>     # Shows: traefik/traefik, traefik/maesh, etc.
helm defaults prometheus<TAB>  # Shows: prometheus-community/prometheus, etc.
```

## Performance

The plugin uses smart caching to provide fast tab completion:

- **First completion**: ~2-3 seconds (builds cache)
- **Subsequent completions**: ~0.1 seconds (uses cache)
- **Cache duration**: 10 minutes
- **Cache location**: `~/.cache/helm-defaults/` or `/tmp/helm-defaults-$USER/`

## Examples

### Repository Charts

```bash
# Popular charts
helm defaults grafana/grafana
helm defaults prometheus-community/kube-prometheus-stack
helm defaults traefik/traefik
```

## License

MIT License - see LICENSE file for details.
