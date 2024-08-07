# GitHub Workflows

Reusable workflows for Axon Ivy Market products

## Using workflows

Add a new workflow to your repository e.g. `.github/workflows/ci.yml`:

```
name: CI-Build

on:
  push:
  workflow_dispatch:

jobs:
  build:
    uses: axonivy-market/github-workflows/.github/workflows/ci.yml@v3
```

or e.g. `.github/workflows/release.yml`:

```
name: Release-Build

on: workflow_dispatch

jobs:
  build:
    uses: axonivy-market/github-workflows/.github/workflows/release.yml@v3

```

## Versions

Are documented as [releases](https://github.com/axonivy-market/github-workflows/releases)
