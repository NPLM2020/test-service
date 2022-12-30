FROM maven:3.8.4-openjdk-17 as maven-builder
COPY src /test-service/src
COPY pom.xml /test-service

RUN mvn -f /test-service/pom.xml clean package -DskipTests
FROM openjdk:17-alpine

COPY --from=maven-builder test-service/target/test-service-0.0.1-SNAPSHOT.jar /test-service/test-service-0.0.1-SNAPSHOT.jar
WORKDIR /test-service

EXPOSE 8080
ENTRYPOINT ["java","-jar","test-service-0.0.1-SNAPSHOT.jar"]