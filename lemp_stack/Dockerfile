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
	yum install -y nginx


RUN mkdir -p /var/www/blog.example.com
RUN wget  http://wordpress.org/latest.tar.gz && tar -xzf latest.tar.gz --strip 1 -C /var/www/blog.example.com
RUN cp /var/www/blog.example.com/wp-config-sample.php /var/www/blog.example.com/wp-config.php
RUN chown -R nginx:nginx /var/www/blog.example.com

COPY www.conf  /etc/opt/rh/rh-php71/php-fpm.d/www.conf
COPY mariadb.repo /etc/yum.repos.d/mariadb.repo

RUN yum update -y && yum install -y \
    centos-release-scl \
    rh-php71-php \
    rh-php71-php-fpm \
    rh-php71-php-mysqlnd \
    MariaDB-server \
    MariaDB-client \
    MariaDB-devel \
    MariaDB-shared
