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
    uses: axonivy-market/github-workflows/.github/workflows/ci.yml@v2
```

or e.g. `.github/workflows/release.yml`:

```
name: Release-Build

on: workflow_dispatch

jobs:
  build:
    uses: axonivy-market/github-workflows/.github/workflows/release.yml@v2

```

## Versions

The following versions are available and can be used by appending them to the workflow file reference, e.g. `ci.yml@v2` or `release.yml@v2`.

### v2
Java version 17 is used in v2. Apply v2 for Axon Ivy Market products that are based on Axon Ivy >= 9.4.

### v1
Java version 11 is used in v1. Apply v1 for Axon Ivy Market products that are based on Axon Ivy < 9.4.