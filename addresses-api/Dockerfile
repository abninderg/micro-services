FROM openjdk:8-jre-alpine

ENV TARGET_DIR=/api

RUN mkdir -p ${TARGET_DIR}
ADD target/api/address-api.jar ${TARGET_DIR}

WORKDIR ${TARGET_DIR}
EXPOSE 8501

ENTRYPOINT ["java", "-jar", "-DServer.port=8501", "address-api.jar"]

