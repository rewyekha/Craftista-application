FROM openjdk:19-jdk-alpine AS builder

RUN apk update && apk add maven 

WORKDIR /app

COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests


EXPOSE 8080

CMD ["java", "-jar", "target/app.jar"]

