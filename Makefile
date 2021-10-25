.PHONY: build

build:
	docker build -t coding-standard .
	@echo "\n\n Use \`docker run -it coding-standard\` to display usage" 
