# Go AWS SAM

WIP: This is udner heavy and active develoment as I learn about each AWS SAM resource

**Curently on hold until AWS resolve some critical issues like:**

Until a suitable solution for [multiple-env deploys](https://github.com/awslabs/serverless-application-model/issues/198) is implemented, the AWS SAW experiance is going to pale in comparrison to more broad frameworks like [apex/up](https://up.docs.apex.sh/)

This is the complete golang repo example for AWS SAM trying to conver working code examples for as many of the features of SAM as possible.

## Prerequisites

- Golang
- AWS CLI
- AWS SAM CLI
- Docker

## Useful Commands

The `Makefile` contains many useful commands.

### `build`

`make build` will create a linux binary in each folder under the `/cmd` directory. It is expected that the binaries are referenced as handlers in the AWS SAM template.yaml. These binaries must exists for the testing of local APIs using the AWS SAM tool.

### `clean`

`make clean` provides an easy way to delete all the binaries built with `make build`. It is not often required to run this comamand as it is always run before `build`

### `local`

`make local` provides an easy way to run the api locally for testing. This is essentially an alias for `sam local start-api` but also cleans and builds the binaries.

### `deploy`

`make deploy` provides an easy way to package and deploy the functions. This will clean, build, package and deploy the functions to AWS.
