FROM openjdk:8-jre-alpine

ENV TARGET_DIR=/api

RUN mkdir -p ${TARGET_DIR}
ADD target/api/accounts-api.jar ${TARGET_DIR}

WORKDIR ${TARGET_DIR}
EXPOSE 8500

ENTRYPOINT ["java", "-jar", "-DServer.port=8500", "accounts-api.jar"]

