# 1. 빌드 단계
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean install -DskipTests

# 2. 런타임 단계
FROM tomcat:10.1-jdk17
# War를 Tomcat webapps에 ROOT로 배포
COPY --from=build /app/target/jangtjdgns-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8000
CMD ["catalina.sh", "run"]
