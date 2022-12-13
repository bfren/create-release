# Create Release

Create a GitHub release from a merged PR.

## Inputs

- `token`: GitHub personal access token
- `repo`: repository name, e.g. 'bfren/create-release' (defaults to `github.repository`)
- `branch`: source branch, e.g. 'dev' (defaults to `main`)
- `title`: release title (defaults to `github.event.pull_request.title`)
- `prerelease`: whether or not this is a prerelease (defaults to `false`)
- `latest`: whether or not this release is the 'latest' (defaults to `true`, other values `false` and `legacy`)

## Usage

Create a release when a PR is merged:

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
