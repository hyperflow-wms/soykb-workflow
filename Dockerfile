FROM ubuntu:14.04
MAINTAINER Bartosz Balis <balis@agh.edu.pl>
RUN apt-get update && apt-get install -y openjdk-7-jre
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && apt-get install -y nodejs
RUN npm install https://github.com/hyperflow-wms/hyperflow-job-executor/archive/master.tar.gz
WORKDIR /soykb
COPY software.tar.gz .
RUN tar zxvf software.tar.gz
RUN chmod +x software/bwa-0.7.4/bwa
COPY *-wrapper ./
ENV PATH="/soykb:${PATH}":/node_modules/.bin
