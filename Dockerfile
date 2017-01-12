FROM centos:7

RUN yum -y clean all && yum -y install apache

EXPOSE 8080
CMD /usr/bin/httpd -DFOREGROUND
