# 1. 빌드 단계
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn clean package -DskipTests

# 2. 런타임 단계 (Spring Boot embedded)
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/jangtjdgns-0.0.1-SNAPSHOT.war app.war

# Render의 PORT 환경변수 사용
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]