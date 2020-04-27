FROM archlinux
MAINTAINER Mateusz Plinta

ENV HYPERFLOW_JOB_EXECUTOR_VERSION=v1.0.11

RUN pacman -Sy 
RUN pacman -S --needed --noconfirm git jre7-openjdk npm python3 libpcap util-linux base-devel libffi

RUN pacman -S --needed --noconfirm sudo
RUN useradd builduser -m
RUN passwd -d builduser
RUN printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers
RUN sudo -u builduser bash -c 'cd ~ && git clone https://aur.archlinux.org/ncurses5-compat-libs.git && cd ncurses5-compat-libs && makepkg -si --skippgpcheck --noconfirm'
RUN sudo -u builduser bash -c 'cd ~ && git clone https://aur.archlinux.org/libffi6.git && cd libffi6 && makepkg -si --noconfirm'

RUN npm install -g https://github.com/hyperflow-wms/hyperflow-job-executor/archive/${HYPERFLOW_JOB_EXECUTOR_VERSION}.tar.gz

WORKDIR /soykb
COPY software/software.tar.gz .
RUN tar zxvf software.tar.gz
COPY software/*-wrapper ./
COPY software/libnethogs.so.0.8.5-63-g68033bf /usr/local/lib
COPY software/nethogs-wrapper.py /usr/local/bin 
RUN chmod +x /usr/local/bin/nethogs-wrapper.py

ENV PATH="/soykb:${PATH}"
