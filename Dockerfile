FROM tomcat:latest
RUN mvn -f pom.xml clean package
COPY ./target/hello-1.0.war /usr/local/tomcat/conf/
EXPOSE 8080
CMD ["catalina.sh", "run"]