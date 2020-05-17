FROM openjdk:13-jdk-oracle

MAINTAINER Wannago Dev1 <Wannago.dev1@gmail.com>

RUN yum update -y && \
    yum clean all

ENV JAVA_OPTS=""
ENV APP_OPTS=""

ADD target/utils-admin-server.jar /app/

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app/utils-admin-server.jar $APP_OPTS"]

HEALTHCHECK --interval=30s --timeout=30s --retries=10 CMD curl -f http://localhost:8102/actuator/health || exit 1

EXPOSE 8002 8102