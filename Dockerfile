FROM centos:centos6
MAINTAINER Kevin McNally "kevin.mcnally@lastminute.com"
ENV REFRESHED_AT 2015-12-02-15:02

RUN yum -y install wget tar java-1.7.0-openjdk

ENV TOMCAT_VERSION 7.0.55
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \ 
        -O /tmp/catalina.tar.gz
RUN tar xzf /tmp/catalina.tar.gz -C /opt
RUN ln -s /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat
RUN rm /tmp/catalina.tar.gz
RUN rm -rf /opt/tomcat/webapps/examples /opt/tomcat/webapps/docs

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
CMD $CATALINA_HOME/bin/catalina.sh run
