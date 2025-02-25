# Stage 1: Build
FROM maven:3.9.2-eclipse-temurin-17 AS builder
WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn package -DskipTests

# Stage 2: Runtime
FROM openjdk:19-jdk-slim
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser
USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
