# 1. 빌드 단계
FROM maven:3.9.3-eclipse-temurin-17 AS build

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# 2. 런타임 단계
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app
COPY --from=build /app/target/jangtjdgns-0.0.1-SNAPSHOT.jar app.jar

# Spring Boot 포트 변경
ENV SERVER_PORT=8000

EXPOSE 8000

ENTRYPOINT ["java", "-jar", "app.jar"]
