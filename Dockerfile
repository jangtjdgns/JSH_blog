# 베이스 이미지
FROM eclipse-temurin:17-jdk-alpine

# 작업 디렉토리 생성
WORKDIR /app

# Maven 빌드용
COPY pom.xml .
COPY src ./src

# Maven 설치 없이 빌드 (Spring Boot Wrapper 사용 가능)
RUN ./mvnw clean package -DskipTests

# 빌드된 jar 복사
COPY target/jangtjdgns-0.0.1-SNAPSHOT.jar app.jar

# 환경변수로 포트 지정 가능
ENV PORT=8000

# 외부 포트 노출
EXPOSE 8000

# 애플리케이션 실행
ENTRYPOINT ["java","-jar","/app/app.jar"]
