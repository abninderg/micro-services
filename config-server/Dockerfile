FROM openjdk:8-jre-alpine

ENV TARGET_DIR=/api

RUN mkdir -p ${TARGET_DIR}
ADD target/api/config-server.jar ${TARGET_DIR}

WORKDIR ${TARGET_DIR}
EXPOSE 8888

ENTRYPOINT ["java", "-jar", "-DServer.port=8888", "config-server.jar"]

