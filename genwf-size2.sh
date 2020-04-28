#!/bin/sh

docker run -v $PWD:/workdir matplinta/soykb-generator sh -c 'generate-workflow 2'