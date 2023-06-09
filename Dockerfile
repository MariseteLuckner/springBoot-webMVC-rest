FROM maven:3.6.3-jdk-11 AS MAVEN_BUILD
# copy the pom and src code to the container
COPY ./ ./
# package our application code
RUN --mount=type=cache,target=/root/.m2 mvn clean -DskipTests package
EXPOSE 8080
# set the startup command to execute the jar
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]