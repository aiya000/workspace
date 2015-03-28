FROM centos
MAINTAINER aiya000 <aiya000.develop@gmail.com>

RUN yum -y update ; yum clean all
RUN yum install -y httpd ; yum clean all
ADD ./index.html /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
