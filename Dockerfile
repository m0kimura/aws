FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install wget nano python && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install awscli && \
    rm get-pip.py && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME /root/.aws
VOLUME /root/my
VOLUME /data
ENV PATH=$PATH:/root/my
ENV AWS_CONFIG_FILE=/root/my/aws.conf
WORKDIR /data
CMD "aws_list.sh"
