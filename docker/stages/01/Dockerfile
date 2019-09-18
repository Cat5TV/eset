FROM debian:buster

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Robbie Ferguson <robbie@category5.tv>

# Setup apt
RUN apt-get update && \
    apt-get install -y apt-utils

# Install a few prerequisites
RUN apt-get update && \
    apt-get install -y ca-certificates wget ssl-cert git unzip make python3 procps

# Setup faux systemd environment
RUN apt-get remove --purge systemd && \
    wget -O /tmp/systemctl.zip https://github.com/gdraheim/docker-systemctl-replacement/archive/v1.4.3000.zip && \
    cd /tmp && \
    unzip systemctl.zip && \
    cd docker-systemctl-replacement* && \
    make && \
    mv -f ./files/docker/systemctl3.py /usr/bin/ && \
    chmod +x /usr/bin/systemctl3.py && \
    ln -s /usr/bin/systemctl3.py /usr/bin/systemctl && \
    ln -s /usr/bin/systemctl /bin/systemctl

RUN /usr/sbin/make-ssl-cert generate-default-snakeoil --force-overwrite

# Also need to setup MDC

EXPOSE 80/tcp 443/tcp 2222/tcp

ENTRYPOINT ["/usr/bin/systemctl","default","--init"]

# Installer ESMC
RUN wget -O /tmp/esmc_debian https://raw.githubusercontent.com/Cat5TV/eset/master/installers/esmc_debian && \
    chmod +x /tmp/esmc_debian && \
    /tmp/esmc_debian force
