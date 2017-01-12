FROM centos:7

USER root
RUN yum clean -y all && yum install -y httpd
RUN sed  -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf
ADD index.html /var/www/html/index.html
#RUN echo 'lany is best!' > /var/www/html/index.html
RUN chmod a+rwx /run/httpd /etc/httpd/logs
USER nobody

EXPOSE 8080
CMD /usr/sbin/httpd -DFOREGROUND
