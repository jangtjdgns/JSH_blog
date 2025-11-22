# 1. 빌드 단계
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# 2. 런타임 단계
FROM tomcat:10.1-jdk17
# War를 Tomcat webapps에 복사 (ROOT로 배포)
COPY --from=build /app/target/jangtjdgns-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Tomcat 커넥터 포트 변경
ENV CATALINA_OPTS="-Dserver.port=8000"
EXPOSE 8000

CMD ["catalina.sh", "run"]
