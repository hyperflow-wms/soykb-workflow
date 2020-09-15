FROM alpine:3.12
MAINTAINER Bartosz Balis <balis@agh.edu.pl>

# Version of the job executor should be passed via docker build, e.g.: 
# docker build --build-arg hf_job_executor_version="1.1.0""
ARG hf_job_executor_version
ENV HYPERFLOW_JOB_EXECUTOR_VERSION=$hf_job_executor_version

ENV NODE_VERSION=12.18.3-r0

RUN apk --update add openjdk7-jre \
 && apk add curl bash \
 && apk add npm=$NODE_VERSION nodejs=$NODE_VERSION \
 && apk add python3 libpcap libpcap-dev util-linux

RUN npm install -g @hyperflow/job-executor@${HYPERFLOW_JOB_EXECUTOR_VERSION}

WORKDIR /soykb
COPY software/software.tar.gz .
RUN tar zxvf software.tar.gz
RUN chmod +x software/bwa-0.7.4/bwa
COPY software/*-wrapper ./
COPY software/libnethogs.so.0.8.5-63-g68033bf /usr/local/lib
COPY software/nethogs-wrapper.py /usr/local/bin 
RUN chmod +x /usr/local/bin/nethogs-wrapper.py
ENV PATH="/soykb:${PATH}"

# ADD FILE BLOCK ACCESS MONITORING LIBRARY (FBAM)
WORKDIR /
RUN apk --no-cache add cmake clang clang-dev make gcc g++ libc-dev linux-headers
ENV FBAM_VERSION=0.4.1
RUN wget https://github.com/cano112/fbam/archive/${FBAM_VERSION}.tar.gz
RUN tar zxvf ${FBAM_VERSION}.tar.gz 
WORKDIR fbam-${FBAM_VERSION}
RUN chmod +x ./build.sh
RUN ./build.sh
RUN mkdir /fbam
RUN cp -r ./build/libblockaccess.so.${FBAM_VERSION} /fbam/libfbam.so
