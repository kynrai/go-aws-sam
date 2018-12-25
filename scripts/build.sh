#!/usr/bin/env bash

# Build tasks to help with developing/building/deploying AWS SAM functions for golang

# Clean - removes built binaries
function clean {
	for cmd in $(go list ./cmd/...) ; do
		rm ${cmd#*/}/${cmd##*/} || true ;
    done
}

function build {
    for cmd in $(go list ./cmd/...) ; do
        printf -- "Building ${cmd}\n"
		GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o ${cmd#*/}/${cmd##*/} ${cmd} ;
    done
    printf -- 'Building complete\n'
}

# Switch case on the first argument to provide CLI like behaviour
case "${1}" in
        clean) clean;;
        build) build;;
        *)
            echo $"Usage: $0 {clean|build}"
            exit 1
 
esac

printf -- '\n';
exit 0;
