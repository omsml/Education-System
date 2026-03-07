# Step 1: Build the application using Maven
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Run the application
FROM eclipse-temurin:17-jdk-focal
WORKDIR /app
# Updated to look for the .war file created by your pom.xml
COPY --from=build /app/target/*.war app.war 
EXPOSE 8081 
# Updated entrypoint to run the WAR file
ENTRYPOINT ["java", "-jar", "app.war"]]


