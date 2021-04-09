FROM tomcat:latest
RUN apt-get update
RUN apt-get -y install default-jdk
RUN apt-get -y install maven
RUN apt-get -y install git
# RUN mvn -f pom.xml clean package
# COPY pom.xml /tmp/app/
# COPY src /tmp/app/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/app/
WORKDIR /tmp/app/
RUN mvn package
RUN cd /tmp/app/target/*.war /usr/local/tomcat/conf/
EXPOSE 8080
CMD ["catalina.sh", "run"]