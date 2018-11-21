SHELL = /bin/bash
IMAGE_NAME = 899239495551.dkr.ecr.us-east-2.amazonaws.com/ep
SOURCE_DIR = docker-scripts/data
PG_VERSION = latest

.PHONY: fix build push

fix:
	@echo "Converting source files to Unix format..."
	@find ${SOURCE_DIR}/* -type f -name *.csv -exec dos2unix {} \;

	@echo "Sanitizing source files..."
	# Remove unnecessary commas and quotation marks
	#   example: "1,501.0" -> 1501.0
	# Convert to thousands
	#   example: 1501.0 -> 1501000
	# Replace multiple leading zeroes with single zero
	#   example: 0000 -> 0
	# Remove leading zeros
	#   example: 0300 -> 300
	# Replace comma separators with pipes
	# Add newline at end of file
	sed -e 's/"\([0-9]\+\),\([0-9.]\+\)"/\1\2/g' \
	    -e 's/\([0-9]\+\)\.\([0-9]\+\)/\1\200/g' \
	    -e 's/,0\+/,0/g' \
	    -e 's/,0\([0-9]\+\)/,\1/g' \
	    -e 's/,/|/g' \
	    -e '$$a\' \
	    -i ${SOURCE_DIR}/*.csv

	@echo "Adding sector code to each line..."
	for file in ${SOURCE_DIR}/*.csv; do \
	    sed -e "s/^/$$(basename -s .csv $${file})|/" -i $${file}; \
	done

	@echo "Combine into single file..."
	for file in ${SOURCE_DIR}/*.csv; do \
	    sed 1d $${file} >> ${SOURCE_DIR}/employment_projection.txt; \
	done

build:
	docker build \
	    --build-arg PG_VERSION=$(PG_VERSION) \
	    --tag $(IMAGE_NAME) \
	    .

push:
	docker push $(IMAGE_NAME)
