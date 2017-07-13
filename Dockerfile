FROM m0kimura/ubuntu-base

RUN apt-get update \


##  GEANY
&&  apt-get install -y libvte9 geany \
##


##  GET PIP
&&  apt-get install -y python \
&&  wget https://bootstrap.pypa.io/get-pip.py \
&&  chmod +x get-pip.py \
&&  ./get-pip.py \
&&  rm get-pip.py \
##


&&    pip install awscli \

&&    apt-get clean \
&&    rm -rf /var/lib/apt/lists/*


##  USER
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
##

ENV PATH=$PATH:/home/${user}/my
ENV AWS_CONFIG_FILE=/home/${user}/my/aws.conf

COPY ./starter.sh /usr/bin/starter.sh
CMD starter.sh
