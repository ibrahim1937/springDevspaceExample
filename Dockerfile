FROM maven:3.8.2-openjdk-17-slim

WORKDIR /app

# Copy the Spring Boot application JAR file
COPY target/springDevspaceExample-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 for the Spring Boot application and port 5005 for remote debugging
EXPOSE 8080 5005

# Set the JVM options for remote debugging
ENV JAVA_TOOL_OPTIONS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"

# Start the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
