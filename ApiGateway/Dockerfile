# Stage 1: Build the Application (Maven Build)
FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

# Yeh sab file ignore krne ke liye
COPY pom.xml .
COPY src ./src

# Maven Build Command
RUN mvn clean install -DskipTests


# Stage 2: Create Slim Docker Image
FROM openjdk:17-jdk-alpine

WORKDIR /app

# JAR File Copy Ho Rha Hai Jo Build Stage Me Bana Tha
COPY --from=builder /app/target/*.jar app.jar

# Port Expose
EXPOSE 8085

# Environment Variables
ENV SPRING_PROFILES_ACTIVE=prod

# Application Run Command
ENTRYPOINT ["java", "-jar", "app.jar"]
