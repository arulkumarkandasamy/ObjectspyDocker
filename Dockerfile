FROM centos:centos6
MAINTAINER Arulkumar
 
#Helpful utils, but only sudo is required
#RUN yum -y install tar
#RUN yum -y install vim
#RUN yum -y install nc
RUN yum -y install sudo
 
######## JDK7
 
#Note that ADD uncompresses this tarball automatically
ADD jdk-7u72-linux-x64.tar.gz /opt
WORKDIR /opt/jdk1.7.0_72
RUN alternatives --install /usr/bin/java java /opt/jdk1.7.0_72/bin/java 1
RUN alternatives --install /usr/bin/jar jar /opt/jdk1.7.0_72/bin/jar 1
RUN alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_72/bin/javac 1
RUN echo "JAVA_HOME=/opt/jdk1.7.0_72" >> /etc/environment
 
######## TOMCAT
 
#Note that ADD uncompresses this tarball automatically
ADD apache-tomcat-7.0.57.tar.gz /usr/share
WORKDIR /usr/share/
RUN mv  apache-tomcat-7.0.57 tomcat7
RUN echo "JAVA_HOME=/opt/jdk1.7.0_72/" >> /etc/default/tomcat7
RUN groupadd tomcat
RUN useradd -s /bin/bash -g tomcat tomcat
RUN chown -Rf tomcat.tomcat /usr/share/tomcat7
EXPOSE 8080
EXPOSE 8443
EXPOSE 22

ADD server.xml /usr/share/tomcat7/conf/server.xml
ADD tomcat-users.xml /usr/share/tomcat7/conf/tomcat-users.xml
ADD ObjectSpyWeb.war /usr/share/tomcat7/webapps/ObjectSpyWeb.war
ADD logServiceRestful.war /usr/share/tomcat7/webapps/logServiceRestful.war
ADD ObjectSpy.jar /usr/share/tomcat7/webapps/ROOT/ObjectSpy.jar
ADD infotreesol.jks /usr/share/infotreesol.jks
ADD clictestjarsigncert.jks /usr/share/tomcat7/webapps/ROOT/clictestjarsigncert.jks
ADD chromedrivers /usr/share/tomcat7/webapps/ROOT/chromedrivers
ADD iedriver32 /usr/share/tomcat7/webapps/ROOT/iedriver32
ADD iedriver64 /usr/share/tomcat7/webapps/ROOT/iedriver64
ADD mysql-connector-java-5.1.24-bin.jar /usr/share/tomcat7/webapps/ROOT/mysql-connector-java-5.1.24-bin.jar
ADD selenium-server-standalone-2.48.2.jar /usr/share/tomcat7/webapps/ROOT/selenium-server-standalone-2.48.2.jar
ADD jersey-client-1.9.1.jar /usr/share/tomcat7/webapps/ROOT/jersey-client-1.9.1.jar
ADD jersey-core-1.9.1.jar /usr/share/tomcat7/webapps/ROOT/jersey-core-1.9.1.jar
ADD jersey-server-1.9.1.jar /usr/share/tomcat7/webapps/ROOT/jersey-server-1.9.1.jar








