SHELL = /bin/bash
IMAGE_NAME = gcr.io/acat-shared/ep
SOURCE_DIR = docker-scripts/data
PG_VERSION = latest

.PHONY: build push

build:
	docker build \
	    --build-arg PG_VERSION=$(PG_VERSION) \
	    --tag $(IMAGE_NAME) \
	    .

push:
	docker push $(IMAGE_NAME)
