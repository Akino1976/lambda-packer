REPOSITORY := lambda-packer
CURRENT_DATE := $(shell echo `date +'%Y-%m-%d'`)
VERSION ?= $(CURRENT_DATE)
DOCKER_URL := docker.io/akino1976
TEST_VERSION := commit_$(shell git rev-parse --short HEAD)

export REPOSITORY
export VERSION
export TEST_VERSION

build-lambdapacker:
	docker build \
		-t $(REPOSITORY):latest \
		-t $(REPOSITORY):$(VERSION) \
		-t $(DOCKER_URL)/$(REPOSITORY):latest \
		-t $(DOCKER_URL)/$(REPOSITORY):$(VERSION) \
		.

date:
	@echo $(CURRENT_DATE)

version:
	@echo ${VERSION}

build-example-handlers-without-credentials: build-lambdapacker
	docker run --rm -it \
		-v "${PWD}/example_handlers:/app/src" \
		-v "${PWD}/packages:/packages" \
		$(DOCKER_URL)/$(REPOSITORY):$(VERSION) \
		example_handler.$(TEST_VERSION).zip
