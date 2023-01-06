FROM openjdk:19-jdk-alpine3.16
ARG JAR_FILE=target/hello-world-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","/app.jar" ]