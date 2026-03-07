# Step 1: Build using Maven
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Run using a light Java image
FROM eclipse-temurin:17-jdk-focal
WORKDIR /app
# We use *.war because we changed the packaging in pom.xml
COPY --from=build /app/target/*.war app.war
EXPOSE 8081
# EXACT SYNTAX: No extra brackets inside the quotes
ENTRYPOINT ["java", "-jar", "app.war"]



