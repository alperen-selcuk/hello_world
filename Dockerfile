# Maven build container 
FROM maven:3-openjdk-11 AS maven_build
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn clean package

#pull base image
FROM openjdk
EXPOSE 8080
CMD java -jar /data/hello-world-0.1.0.jar
COPY --from=maven_build /tmp/target/hello-world-0.1.0.jar /data/hello-world-0.1.0.jar
