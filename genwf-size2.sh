#!/bin/sh

docker run -v $PWD:/workdir matplinta/soykb-generator sh -c 'cd /workdir && generate-workflow 2'