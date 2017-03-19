FROM ubuntu
ENV HOME=/root
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install apache2 -y
WORKDIR /
RUN git clone https://github.com/rexminnis/web-app-docker-demo
WORKDIR /web-app-docker-demo/
RUN git checkout -b rexminnis-patch-1
RUN git pull origin rexminnis-patch-1
RUN cp index.html /var/www/html/
RUN service apache2 restart
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
