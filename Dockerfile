FROM maven:3.8.1-openjdk-17-slim

VOLUME /tmp
ADD . /usr/src/app
WORKDIR /usr/src/app

RUN mvn clean package -DskipTests
RUN curl -L https://github.com/aws-observability/aws-otel-java-instrumentation/releases/download/v1.19.2/aws-opentelemetry-agent.jar --output opentelemetry-javaagent-all.jar
ENTRYPOINT [ "java", "-javaagent:opentelemetry-javaagent-all.jar", "-jar", "target/opentel-0.0.1-SNAPSHOT.jar" ]
