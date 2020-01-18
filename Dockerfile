FROM ubuntu:18.04

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
	curl \
	git \
	make 

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

RUN service photo-storage start && \
	service photo-filter start && \
	service web-client start
