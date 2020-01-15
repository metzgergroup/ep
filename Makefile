SHELL = /bin/bash
IMAGE_NAME = gcr.io/acat-shared/ep
SOURCE_DIR = docker-scripts/data
PG_VERSION = 11.6
VERSION = 2016_2026

.PHONY: build push

build:
	docker build \
	    --build-arg PG_VERSION=$(PG_VERSION) \
	    --tag $(IMAGE_NAME):$(VERSION) \
	    .

push:
	docker tag $(IMAGE_NAME):$(VERSION) $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):latest
