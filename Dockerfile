FROM alpine:3.9
MAINTAINER Bartosz Balis <balis@agh.edu.pl>
RUN apk --update add openjdk7-jre
RUN apk add curl
RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.9/main/ nodejs=10.14.2-r0
RUN apk add npm
RUN npm install https://github.com/hyperflow-wms/hyperflow-job-executor/archive/master.tar.gz
RUN apk add bash
WORKDIR /soykb
COPY software.tar.gz .
RUN tar zxvf software.tar.gz
RUN chmod +x software/bwa-0.7.4/bwa
COPY *-wrapper ./
ENV PATH="/soykb:${PATH}":/node_modules/.bin
