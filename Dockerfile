FROM	ubuntu:latest

LABEL	maintainer="sunilsaini"

RUN 	apt-get update &&\
	apt install -y wget curl net-tools vim unzip && \
	apt install -y apache2 && \
	wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip && \
	mv neo* /opt

WORKDIR	/opt

RUN	unzip *.zip && \
        rm *.zip && \
        cp -r neo*/* /var/www/html/
#COPY	index.html /var/www/html
WORKDIR	/var/www/html

EXPOSE	80/tcp

CMD	["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
