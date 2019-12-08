# Soykb workflow for HyperFlow

## Build and publish image
HyperFlow Docker image contains Soykb binaries and HyperFlow job executor
- `make` -- build the container and push to Docker Hub
- `make container` -- build the container

## Running locally

You can run a sample workflow by downloading a zip archive with workflow and Soykb data files (1.2 GB).

To run the workflow locally using the `soykb-worker` Docker image, you need to have HyperFlow installed and the Redis server running. Then unzip the chosen zip archive and run commands:

```
cd <unpacked_zip_dir>
. run.sh
```
All files will be generated in the `input` directory. Please note that running the workflow on a single node may require a considerable amount of memory.

## Running in a Kubernetes cluster

On the container where the HyperFlow engine is running, define the following environment variable:
```
HF_VAR_function="k8sCommand"
```
TODO
