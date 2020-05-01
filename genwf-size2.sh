#!/bin/sh

docker run -v $PWD:/workdir hyperflowwms/soykb-generator sh -c 'generate-workflow 2'