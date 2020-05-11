FROM openjdk:8-jre-alpine

ENV TARGET_DIR=/api

RUN mkdir -p ${TARGET_DIR}
ADD addresses-api.jar ${TARGET_DIR}

ADD startup.sh ${TARGET_DIR}

WORKDIR ${TARGET_DIR}
RUN chmod 777 startup.sh
EXPOSE 8501

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.0/wait /wait
RUN chmod +x /wait

CMD /wait &&  ./startup.sh

