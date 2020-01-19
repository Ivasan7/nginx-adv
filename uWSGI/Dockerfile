FROM centos:7

RUN yum update -y && yum upgrade -y
RUN  yum install -y \
	vim \
	curl \
	lsb-core \
	gnupg \
	systemd \
	apache2-utils \
	git \
	wget \
	initscripts

RUN yum install -y epel-release && \
	yum install -y \ 
	nginx \
	python36 \
	python36-devel

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN pip3.6 install pipenv request

RUN mkdir -p /srv/www && git clone https://github.com/linuxacademy/content-nginx-uwsgi && \
	cd content-nginx-uwsgi && make install && \
	make service

#config DB : mysql -u root -p

ENV NOTES_HOST=notes.example.com
ENV NOTES_DB=django_notes
ENV NOTES_DB_USER=notes
ENV NOTES_DB_PASSWORD="p@ssw0rd"

RUN cd /srv/www/content-nginx-uwsgi && make migrate

#start notes.uwsgi service

RUN pip3.6 install -y boom


