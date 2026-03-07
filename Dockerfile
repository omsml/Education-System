# Step 1: Build using Maven
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Run the application
FROM eclipse-temurin:17-jdk-focal
WORKDIR /app
# Copy the .war file produced by your pom.xml
COPY --from=build /app/target/*.war app.war
# Ensure this matches your application.properties
ENV PORT=8081
EXPOSE 8081
# Explicitly tell Java to bind to port 8081
ENTRYPOINT ["java", "-Dserver.port=8081", "-jar", "app.war"]
