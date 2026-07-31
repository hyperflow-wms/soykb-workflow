PREFIX = hyperflowwms
REPO_NAME = soykb-worker
# Workflow version, bumped by hand when the image itself changes
VERSION = 1.2
# ?= so CI and Renovate can override the version from the environment
HF_JOB_EXECUTOR_VERSION ?= 1.4.2
TAG = $(VERSION)-je$(HF_JOB_EXECUTOR_VERSION)

all: push

container: image

image:
	docker build --build-arg hf_job_executor_version=$(HF_JOB_EXECUTOR_VERSION) -t $(PREFIX)/$(REPO_NAME):$(TAG) .
	docker tag $(PREFIX)/$(REPO_NAME):$(TAG) $(PREFIX)/$(REPO_NAME):$(VERSION)-latest

push: image
	docker push $(PREFIX)/$(REPO_NAME):$(TAG)
	docker push $(PREFIX)/$(REPO_NAME):$(VERSION)-latest

clean:
	docker rmi $(PREFIX)/$(REPO_NAME):$(TAG) $(PREFIX)/$(REPO_NAME):$(VERSION)-latest || true

.PHONY: all container image push clean
