FROM tomcat:latest
RUN apt-get update
RUN apt-get -y install maven
# RUN mvn -f pom.xml clean package
RUN mvn package
COPY target/*.war /usr/local/tomcat/conf/
EXPOSE 8080
CMD ["catalina.sh", "run"]