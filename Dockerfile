FROM ubuntu:18.04

RUN apt-get update -y && apt-get upgrade -y
RUN  apt-get install -y \
	vim \
	curl \
	lsb-core \
	gnupg \
	systemd \
	apache2-utils \
	git \
	wget

RUN echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | tee /etc/apt/sources.list.d/nginx.list && \
    curl -fsSL https://nginx.org/keys/nginx_signing.key |  apt-key add - && \
    apt-key fingerprint ABF5BD827BD9BF62 && \
    apt update && apt install nginx
#Install node.js

RUN curl -sL https://deb.nodesource.com/setup_13.x 
RUN apt-get install -y \
	nodejs \
	npm

RUN mkdir -p /srv/www && \
	cd /srv/www/ && \
	git clone https://github.com/CloudAssessments/s3photoapp && \
	cd s3photoapp && \
	make install

COPY photo-filter.service /etc/systemd/system/photo-filter.service
COPY photo-storage.service /etc/systemd/system/photo-storage.service
COPY web-client.service /etc/systemd/system/web-client.service
COPY photos.example.com.conf /etc/nginx/conf.d/photos.example.com.conf

RUN service photo-storage start && \
	service photo-filter start && \
	service web-client start
