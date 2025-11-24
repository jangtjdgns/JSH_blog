# 1. 빌드 단계
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn clean install -DskipTests

# 2. 런타임 단계 (External Tomcat)
FROM tomcat:10.1-jdk17

# 기본 webapps 제거 (충돌 방지)
RUN rm -rf /usr/local/tomcat/webapps/*

# WAR → ROOT로 배포
COPY --from=build /app/target/jangtjdgns-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Tomcat 기본 포트 사용
EXPOSE 8080

CMD ["catalina.sh", "run"]
