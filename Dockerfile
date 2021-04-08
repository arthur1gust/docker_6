FROM tomcat:latest
RUN apt-get update
RUN apt-get -y install maven
# RUN mvn -f pom.xml clean package
COPY pom.xml /tmp/app/
COPY src /tmp/app/
WORKDIR /tmp/app/
RUN mvn package
COPY /tmp/app/target/*.war /usr/local/tomcat/conf/
EXPOSE 8080
CMD ["catalina.sh", "run"]