# Soykb workflow for HyperFlow

[![](https://images.microbadger.com/badges/version/hyperflowwms/soykb-workflow-worker.svg)](https://microbadger.com/images/hyperflowwms/soykb-workflow-worker "Get your own version badge on microbadger.com")

## Build and publish image
HyperFlow Docker image contains Soykb binaries and HyperFlow job executor
- `make` -- build the container and push to Docker Hub
- `make container` -- build the container

## Running locally

You can run a sample workflow by downloading a zip archive with [Soykb workflow data files](https://drive.google.com/open?id=1p-P_aJaOC48kTWWg2hgkoF4MIu2uaHvY) (1.2 GB).

To run the workflow locally using the `soykb-worker` Docker image, you need to have HyperFlow installed and the Redis server running. Then unzip the chosen zip archive and run commands:

```
cd <unpacked_zip_dir>
. run.sh
```
All files will be generated in the `input` directory. Please note that running the workflow on a single node may require a considerable amount of memory.

## Running in a Kubernetes cluster

To run the workflow on a Kubernetes cluster, you can use the [HyperFlow-k8s-deployment project](https://github.com/hyperflow-wms/hyperflow-k8s-deployment). 
