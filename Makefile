SHELL = /bin/bash
IMAGE_NAME = gcr.io/acat-shared/ep
SOURCE_DIR = docker-scripts/data
PG_VERSION = 11.6
VERSION = 2018_2028

.PHONY: data build push clean

data:
	wget https://www.bls.gov/emp/ind-occ-matrix/matrix.xlsx -O docker-scripts/data/matrix.xlsx
	python3 convert_and_extract.py

build:
	docker build \
	    --build-arg PG_VERSION=$(PG_VERSION) \
	    --tag $(IMAGE_NAME):$(VERSION) \
	    .

push:
	docker tag $(IMAGE_NAME):$(VERSION) $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):latest

clean:
	find ${SOURCE_DIR} -type f -not -name "*.csv" -delete
