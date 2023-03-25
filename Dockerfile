FROM maven:3.8.4-jdk-11-slim AS build
WORKDIR /app
COPY . .
RUN mvn -DskipTests=true clean package
RUN mv target/*.jar app.jar

FROM openjdk:17-jdk-alpine
COPY --from=build /app/app.jar /app/app.jar
EXPOSE 8080 5005
# Set the JVM options for remote debugging
ENV JAVA_TOOL_OPTIONS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"


CMD ["java", "-jar", "/app/app.jar"]

