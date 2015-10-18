FROM ubuntu:latest

MAINTAINER Elias Faxö <elias.faxo@gmail.com>

ADD ./config /config
ADD ./application /application

RUN apt-get -qq update 
RUN apt-get --no-install-recommends -qqy install git
RUN apt-get --no-install-recommends -qqy install nginx
RUN apt-get --no-install-recommends -qqy install supervisor
RUN apt-get --no-install-recommends -qqy install build-essential
RUN apt-get --no-install-recommends -qqy install python3
RUN apt-get --no-install-recommends -qqy install python3-dev
RUN apt-get --no-install-recommends -qqy install python3-pip
RUN apt-get --no-install-recommends -qqy install nodejs
RUN apt-get --no-install-recommends -qqy install npm
RUN apt-get --on-install-recommends -qqy install docker.io
RUN rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf && rm /etc/nginx/sites-enabled/default && ln -s /config/nginx.conf /etc/nginx/sites-enabled/ && ln -s /config/supervisor.ini /etc/supervisor/conf.d/supervisor.conf
RUN git clone https://github.com/elifa/undockd.git /application/undockd
RUN python3 -m pip install -r /application/requirements.txt && python3 -m pip install -r /application/undockd/requirements.txt
RUN npm install -g webpack

WORKDIR /application/undockd/static

RUN npm install

EXPOSE 80

VOLUME /application/undockd
VOLUME /var/run/docker.sock

CMD ["supervisord", "-n"]
