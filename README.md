# semantic-release-alpine
Alpine docker image for using semantic release in CI jobs.


## Usage

### Basic Use:
```yaml
- uses: rdaniels6813/semantic-release-alpine@master
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}
```
### Additional Plugins
Include additional semantic-release plugins separated by a space
```yaml
- uses: rdaniels6813/semantic-release-alpine@master
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}
    plugins: '<plugin-npm-package-1>@<version> <plugin-npm-package-2>@<version>'
```
### Subsequent steps dependent on a release
```yaml
- id: semantic-release
  uses: rdaniels6813/semantic-release-alpine@master
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}
- if: steps.semantic-release.outputs.released-version-number != ''
  env:
    VERSION_NUMBER: ${{ steps.semantic-release.outputs.released-version-number }}
    VERSION_TAG: ${{ steps.semantic-release.outputs.released-version }}
  run: |
    echo $VERSION_TAG
    echo $VERION_NUMBER
```
This configuration will only run the echo statements when a release has been created.
The output values will be
- VERSION_TAG=v1.0.0
- VERSION_NUMBER=1.0.0