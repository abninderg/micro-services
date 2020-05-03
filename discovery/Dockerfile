FROM openjdk:8-jre-alpine

ENV TARGET_DIR=/api

RUN mkdir -p ${TARGET_DIR}
ADD target/api/discovery.jar ${TARGET_DIR}

WORKDIR ${TARGET_DIR}
EXPOSE 8761

ENTRYPOINT ["java", "-jar", "-DServer.port=8761", "discovery.jar"]

