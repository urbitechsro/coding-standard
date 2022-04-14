.PHONY: build

build:
	docker buildx build --platform linux/arm/v7,linux/arm64/v8,linux/amd64 -t coding-standard .
	@echo "\n\n Use \`docker run -it coding-standard\` to display usage" 
