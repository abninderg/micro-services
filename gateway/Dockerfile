FROM openjdk:8-jre-alpine

ENV TARGET_DIR=/api

RUN mkdir -p ${TARGET_DIR}
ADD target/api/gateway.jar ${TARGET_DIR}

WORKDIR ${TARGET_DIR}
EXPOSE 8111

ENTRYPOINT ["java", "-jar", "-DServer.port=8111", "gateway.jar"]

