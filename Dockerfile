FROM openshift/base-centos7
MAINTAINER Lars Nyman <lars.nyman@basefarm.com>
USER root
RUN yum install -y httpd && yum clean -y all
RUN sed  -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf
ADD index.html /var/www/html/index.html
#RUN echo 'lany is best!' > /var/www/html/index.html
RUN chmod -R a+rwx /run/httpd /etc/httpd/logs
#RUN setcap cap_net_bind_service=+ep /usr/sbin/httpd
USER nobody

LABEL io.k8s.description="lany's apache s2i image" \
      io.k8s.display-name="Apache s2i" \
      io.openshift.expose-service="8080:http" \
      io.openshift.tags="builder,apache"

EXPOSE 8080
CMD /usr/sbin/httpd -DFOREGROUND
