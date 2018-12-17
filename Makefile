BINARIES=$$(go list ./cmd/...)

.PHONY: deps clean build

deps:
	go get -u ./...

clean: 
	@for cmd in $(BINARIES) ; do \
		rm $${cmd#*/}/$${cmd##*/} || true ; \
    done
	
build: clean
	@for cmd in $(BINARIES) ; do \
		GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o $${cmd#*/}/$${cmd##*/} $${cmd} ; \
    done
	
