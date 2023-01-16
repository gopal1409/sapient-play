FROM openjdk:19-jdk-alpine3.16
ARG JAR_FILE=target/sapient-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.jar"]