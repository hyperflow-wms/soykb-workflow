ifndef WORKFLOW_DIR
$(error WORKFLOW_DIR is not set. Example, make push WORKFLOW_DIR=soykb2)
endif

DATA_NAME ?= $(shell basename $(WORKFLOW_DIR))
PREFIX = hyperflowwms
REPO_NAME = soykb-workflow-data

# Linux and macos compatibility
MD5_COMMAND = $(shell type -p md5sum || type -p md5)
WORKFLOW_DIR_HASH = $(shell md5 -q $(WORKFLOW_DIR).zip 2>/dev/null ||  md5sum $(WORKFLOW_DIR).tar.gz | cut -d' ' -f1)
$(info MD5 of the workflow archive WORKFLOW_DIR_HASH=$(WORKFLOW_DIR_HASH))
BUILD_DATE = $(shell date +'%y.%m.%d' | $(MD5_COMMAND) )

NUMBER_OF_FILES=$(shell wc -l $(WORKFLOW_DIR) | cut -d' ' -f1)

DATA_LATEST = $(PREFIX)/$(REPO_NAME):$(DATA_NAME)-latest
DATA_TAGED = $(PREFIX)/$(REPO_NAME):$(DATA_NAME)-$(WORKFLOW_DIR_HASH)

all: push

push: push-workflow-data # push-data-sample
images: image-workflow-data #image-data-sample 

image-workflow-data:
	echo "*" > .dockerignore
	echo "!$(WORKFLOW_DIR)" >> .dockerignore
	docker build --squash --build-arg WORKFLOW_DIR=$(WORKFLOW_DIR) -t $(DATA_LATEST) . # Build new image and automatically tag it as latest
	docker tag $(DATA_LATEST) $(DATA_TAGED)  # Add the version tag to the latest image

push-workflow-data: image-workflow-data
	docker push $(DATA_LATEST) # Push image tagged as latest to repository
	docker push $(DATA_TAGED) # Push version tagged image to repository (since this image is already pushed it will simply create or update version tag)

clean:
	rm .dockerignore
# 	rm paths-sample
