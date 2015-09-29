FROM ubuntu:latest

MAINTAINER Elias Faxö <elias.faxo@gmail.com>

ADD ./config /config
ADD ./application /application

RUN apt-get -qq update && apt-get --no-install-recommends -qqy install git nginx supervisor build-essential python3 python3-dev python3-pip nodejs npm && rm -rf /var/lib/apt/lists/* && ln -s /usr/bin/nodejs /usr/bin/node
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf && rm /etc/nginx/sites-enabled/default && ln -s /config/nginx.conf /etc/nginx/sites-enabled/ && ln -s /config/supervisor.conf /etc/supervisor/conf.d/
RUN git clone https://github.com/elifa/undockd.git /application/undockd
RUN python3 -m pip install -r /application/requirements.txt && python3 -m pip install -r /application/undockd/requirements.txt
RUN npm install -g webpack

WORKDIR /application/undockd/static

RUN npm install

EXPOSE 80

VOLUME /application/undockd

CMD ["supervisord", "-n"]
