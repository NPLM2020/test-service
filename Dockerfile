FROM openjdk:17
EXPOSE 8080
ARG JAR_FILE=target/test-service-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} test-service-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar", "/test-service-0.0.1-SNAPSHOT.jar"]