# Use JDK to build the JAR
FROM openjdk:17-jdk-slim as build
WORKDIR /app
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src
RUN ./mvnw clean package -Dmaven.test.skip=true  # Builds JAR to /app/target

# Run the JAR
FROM openjdk:17-jdk-slim
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8081  
ENTRYPOINT ["java", "-jar", "app.jar"]