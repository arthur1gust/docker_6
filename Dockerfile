FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install default-jdk
RUN mkdir /opt/tomcat
RUN tar xzvf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1
EXPOSE 80