# Go AWS SAM

WIP: This is udner heavy and active develoment as I learn about each AWS SAM resource

This is the complete golang repo example for AWS SAM trying to conver working code examples for as many of the features of SAM as possible.

## Prerequisites

- Golang
- AWS CLI
- AWS SAM CLI

## Useful Commands

The `Makefile` contains many useful commands.

### `build`

`make build` will create a linux binary in each folder under the `/cmd` directory. It is expected that the binaries are referenced as handlers in the AWS SAM template.yaml. These binaries must exists for the testing of local APIs using the AWS SAM tool.

### `clean`

`make clean` provides and easy way to delete all the binaries built with `make build`. It is not often required to run this comamand as it is always run before `build`
