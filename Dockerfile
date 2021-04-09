# FROM tomcat:latest
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install default-jdk
RUN apt-get -y install maven
RUN apt-get -y install git

ENV CATALINA_HOME /usr/local/tomcat
RUN mkdir -p "$CATALINA_HOME"
RUN mkdir -p "$CATALINA_HOME"/conf/

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.35
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN set -x curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz

# RUN mvn -f pom.xml clean package
# COPY pom.xml /tmp/app/
# COPY src /tmp/app/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/app2/
WORKDIR /tmp/app2/
RUN mvn package
RUN cp /tmp/app2/target/*.war /usr/local/tomcat/conf/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]