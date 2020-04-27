FROM mhart/alpine-node:12

LABEL maintainer "Mateusz Plinta <matplinta@gmail.com>"

RUN apk add python-dev

RUN mkdir /soykb-workflow

ADD . /soykb-workflow/

RUN npm install https://github.com/hyperflow-wms/pegasus-hyperflow-converter/archive/master.tar.gz /

ENV PATH /soykb-workflow:/node_modules/.bin:$PATH
ENV PYTHONPATH=/soykb-workflow
WORKDIR /soykb-workflow
