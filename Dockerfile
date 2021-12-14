FROM openjdk:13-jdk-alpine3.10
COPY target/hello-world-1.0-SNAPSHOT.jar /opt/app/app.jar
CMD ["java", "-jar", "/opt/app/app.jar"]
