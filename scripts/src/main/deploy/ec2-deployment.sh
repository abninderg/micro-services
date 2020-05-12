#!/bin/bash

DOCKER_SCRIPTS_SRC_PATH="${WORKSPACE}/target/scripts/ec2"
SCRIPTS_DESTINATION_FOLDER="/home/ec2-user/scripts/ec2"

ssh-keyscan -H "${EC2_PUBLIC_DNS}" >> ~/.ssh/known_hosts

#echo creating directory ${SCRIPTS_DESTINATION_FOLDER} on "${EC2_PUBLIC_DNS}" if it doesnt exist
ssh -i ${EC2_PEM_KEY_PATH} "ec2-user@${EC2_PUBLIC_DNS}" mkdir -p ${SCRIPTS_DESTINATION_FOLDER}

#copy scripts to ec2 instance
echo copying scripts from ${DOCKER_SCRIPTS_SRC_PATH} to ${SCRIPTS_DESTINATION_FOLDER} on ${EC2_PUBLIC_DNS}
scp -i ${EC2_PEM_KEY_PATH} ${DOCKER_SCRIPTS_SRC_PATH}/*.sh "ec2-user@${EC2_PUBLIC_DNS}":${SCRIPTS_DESTINATION_FOLDER}
scp -i ${EC2_PEM_KEY_PATH} ${DOCKER_SCRIPTS_SRC_PATH}/*.yml "ec2-user@${EC2_PUBLIC_DNS}":${SCRIPTS_DESTINATION_FOLDER}

#start docker compose
ssh -i ${EC2_PEM_KEY_PATH} "ec2-user@${EC2_PUBLIC_DNS}" ${SCRIPTS_DESTINATION_FOLDER}/start-all-containers.sh ${SCRIPTS_DESTINATION_FOLDER}

exit $?