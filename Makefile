SHELL = /bin/bash
IMAGE_NAME = 899239495551.dkr.ecr.us-east-2.amazonaws.com/ep
SOURCE_DIR = docker-scripts/data
PG_VERSION = latest

.PHONY: fix build push

build:
	docker build \
	    --build-arg PG_VERSION=$(PG_VERSION) \
	    --tag $(IMAGE_NAME) \
	    .

push:
	docker push $(IMAGE_NAME)
