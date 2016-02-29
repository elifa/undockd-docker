FROM ubuntu:xenial

MAINTAINER Elias Faxö <elias.faxo@gmail.com>

ADD ./config /config
ADD ./application /application

RUN apt-get update \
 && apt-get --no-install-recommends -y install \
            build-essential \
            nodejs \
            npm \
            python3-dev \
            python3-pip \
            python3-setuptools \
            uwsgi-plugin-python3 \
            git \
            nginx \
            docker \
            supervisor \
 && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf \
 && rm -rf /etc/nginx/sites-enabled \
 && ln -sf /config/nginx.conf /etc/nginx/conf.d/undockd.conf \
 && mkdir -p /etc/supervisor/conf.d \
 && ln -sf /config/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

RUN git clone https://github.com/elifa/undockd.git /application/undockd

RUN python3 -m pip install -r /application/requirements.txt \
 && python3 -m pip install -r /application/undockd/requirements.txt

WORKDIR /application/undockd/static

RUN npm install --unsafe-perm

EXPOSE 80

VOLUME /application/undockd
VOLUME /var/run/docker.sock

CMD ["supervisord", "-n"]
