FROM maven:3.8.6-eclipse-temurin-19-alpine as builder
WORKDIR /maven-build
COPY pom.xml .
COPY src .
RUN ["mvn", "-T", "1C", "package", "-DskipTests"]

FROM openjdk:19-slim
COPY --from=builder /maven-build/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 10000