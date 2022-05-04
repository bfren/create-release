# Create Release

Create a GitHub release from a merged PR.

## Inputs

- `token`: GitHub personal access token

## Usage

Create a release when a PR is merged, using the PR title as the release name and tag.

```yml
name: auto-release

on:
  pull_request:
    types: [closed]
  workflow_dispatch:

jobs:
  create-release:
    if: github.event.pull_request.merged
    runs-on: ubuntu-latest
    steps:
    -
      name: Create Release ${{ github.event.pull_request.title }}
      uses: bfren/create-release@v1
      with:
        token: ${{ secrets.PAT }}
```

## Licence

> [MIT](https://mit.bfren.dev/2022)

## Copyright

> Copyright (c) 2022 bfren
> Unless otherwise stated
