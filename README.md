# Minecraft Server Helm Chart

This repository contains Helm charts for deploying a Minecraft server on Kubernetes.

## Installation

## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```
helm repo add clucktopia-repo https://clucktopia.github.io/helm-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages. You can then run `helm search repo clucktopia-repo` to see the charts.

To install a chart:

```
helm install <chart-name> clucktopia-repo/<chart-name>
```

To uninstall the chart:

```
helm uninstall <chart-name>
```

## Charts

## `📦 minecraft-server`

A flexible and minimalistic Helm chart to run a Minecraft Java Edition server on Kubernetes.

## `📦 minecraft-proxy`

...

## `📦 minecraft-exporter`

...

## `📦 minecraft-backup`

...

## License

This project is licensed under the MIT License. See [LICENSE](./LICENSE.md) for details.

## Acknowledgements

While this chart was written from scratch, it was conceptually inspired by the [itzg/minecraft-server-charts](https://github.com/itzg/minecraft-server-charts) project.
