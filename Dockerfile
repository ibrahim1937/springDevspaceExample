FROM maven:3.8.4-openjdk-17-slim

# Copy the Spring Boot application source code to the container
COPY . /app

WORKDIR /app

# Build the Spring Boot application JAR file and rename it to app.jar
# RUN #mvn package -DskipTests && mv

COPY target/springDevspaceExample-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 v for the Spring Boot application and port 5005 for remote debugging
EXPOSE 8080 5005

# Set the JVM options for remote debugging
ENV JAVA_TOOL_OPTIONS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"

# Start the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
