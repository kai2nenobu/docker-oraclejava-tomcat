FROM store/oracle/serverjre:8

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.15
ENV TOMCAT_TGZ_URL https://www.apache.org/dyn/closer.cgi?action=download&filename=tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
ENV CATALINA_HOME /usr/local/tomcat

RUN yum install -y tar gzip && yum clean all && \
    curl -sL "$TOMCAT_TGZ_URL" -o /tmp/tomcat.tar.gz
RUN tar xvf /tmp/tomcat.tar.gz --directory /tmp && \
    mv "/tmp/apache-tomcat-${TOMCAT_VERSION}" "$CATALINA_HOME" && \
    rm -f /tmp/tomcat.tar.gz
EXPOSE 8080
WORKDIR /usr/local/tomcat
CMD /usr/local/tomcat/bin/catalina.sh run
