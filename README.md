# change-string-case-action-min-dependencies
 Github Action: Make a string lowercase, uppercase, or capitalized ; done purely in bash

 ## features:
 - support for UTF-8 strings
 - minimal dependencies (small footprint)
 - this action has tests to guarantee a smooth experience for you

## What do you mean by "minimal dependencies" or "done purely in shell"
- using only simple standard bash commands
- here a list of typical advantages for this approach:
    - no dependency on a specific execution environment
        - no need to update the action
    - less code -> less bugs -> less security issues
        - total number of code lines: 11

## inspiration for this project:
from this project: https://github.com/ASzc/change-string-case-action

# usage

# Change String Case GitHub Action

This action accepts any string, and outputs three different versions of that string:

- lowercase (`XyZzY` -> `xyzzy`)
- uppercase (`XyZzY` -> `XYZZY`)
- capitalized (`Xyzzy` -> `Xyzzy`)

You can access the outputted strings through the job outputs context. See docs [here](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjobs_idoutputs), or the Example Usage section below.

## Inputs

### `string`

**Required** The string you want manipulated

## Outputs

### `lowercase`

`echo '${{ inputs.string }}' | LC_ALL=en_US.UTF-8 tr '[:upper:]' '[:lower:]'`

Example: `XyZzY` -> `xyzzy`

### `uppercase`

`echo '${{ inputs.string }}' | LC_ALL=en_US.UTF-8 tr '[:lower:]' '[:upper:]'`

Example: `XyZzY` -> `XYZZY`

### `capitalized`

```bash
input='${{ inputs.string }}'
firstCharacter="${input::1}"
firstCharacter=$(echo "$firstCharacter" | LC_ALL=en_US.UTF-8 tr '[:lower:]' '[:upper:]')
restOfString="${input:1}"
restOfString=$(echo "$restOfString" | LC_ALL=en_US.UTF-8 tr '[:upper:]' '[:lower:]')
result="${firstCharacter}${restOfString}"
```

Example: `XyZzY` -> `Xyzzy`

## Example Usage

```yaml
name: SomeWorkflow
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      - id: string
        uses: Entepotenz/change-string-case-action@v1
        with:
          string: XyZzY
      - id: step2
        run: echo ${{ steps.string.outputs.lowercase }}
```
