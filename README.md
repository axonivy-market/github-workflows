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
    uses: axonivy-market/github-workflows/.github/workflows/ci.yml@v14
```

or e.g. `.github/workflows/release.yml`:

```
name: Release-Build

on: workflow_dispatch

jobs:
  build:
    uses: axonivy-market/github-workflows/.github/workflows/release.yml@v14

```

## Versions

Are documented as [releases](https://github.com/axonivy-market/github-workflows/releases)

We maintain one tag for each LTS release:

```
@14 -> release/14.0
@v6 -> release/12.0
```

Default versions of tools like Java or Maven are bound to fit an LTS release train of Axon Ivy.
Overriding these defaults in consuming repositories should rarely if ever be necessary.
Note that defaults for dev builds change during the release cycle.

Existing tags may be updated at any point to reflect important infrastructure changes,
without requiring all usages in the axonivy-market to update.
