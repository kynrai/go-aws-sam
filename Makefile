BINARIES=$$(go list ./cmd/...)
STACK_NAME=go-aws-sam

.PHONY: deps clean build local deploy validate package

deps:
	go get -u ./...

clean:
	@./scripts/build.sh clean
	
build: clean
	@./scripts/build.sh build
	
local: build
	@sam local start-api

deploy: validate build package
	@sam deploy --template-file deploy-template.yaml \
		--stack-name go-aws-sam \
		--capabilities CAPABILITY_IAM \
		--profile $(AWS_PROFILE) && \
	rm deploy-template.yaml

validate:
	@sam validate \
		--profile $(AWS_PROFILE)

package: 
	@sam package \
		--s3-bucket go-aws-sam-packages \
		--output-template-file deploy-template.yaml \
		--profile $(AWS_PROFILE) 
