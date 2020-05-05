#!/bin/bash -xe
properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', numToKeepStr: '3']]])

node {
    def mvn_home
    def docker

    environment {
        ec2_pem_key_path = "/Users/abninder/aws_credentials/HelloWorld.pem"
        REPO="abninder"
    }

    stage('Initialize') {
        docker = tool 'docker'
        mvn_home = tool 'maven'
        env.PATH = "${docker}/bin:${mvn_home}/bin:${env.PATH}"
    }

    //check out deployment project
    stage('SCM Checkout') {
        git 'https://github.com/abninderg/micro-services.git'
    }

    //rebuild and package the deployment project
    stage('Compile-Package') {
        sh "${mvn_home}/bin/mvn package"
    }

    //build the docker image tagging it with the jenkins build number
    stage('Build and upload images to docker-hub') {

        sh "chmod 777 ${WORKSPACE}/target/scripts/docker/*.sh"
        sh "${WORKSPACE}/target/scripts/docker/remove-previous-images.sh"

        dir("${WORKSPACE}/target/scripts/docker"){
            sh "./create-images.sh env.REPO"
        }
    }

    //login into docker hub and push the built images to docker hub
    //with image tag
    stage('Push images to docker hub') {
        withCredentials([string(credentialsId: 'dockerLog', variable: 'DockerHubLogin')]) {
            sh "docker login -u abninder -p ${DockerHubLogin}"
            dir("${WORKSPACE}/target/scripts/docker"){
                sh "./push-images.sh"
            }
        }
    }

   // stage('prepare ec2 instance and deploy') {
    //    sh "chmod 777 ${WORKSPACE}/target/scripts/*.sh"
    //    sh(script: "${WORKSPACE}/target/scripts/ec2-prepare-instance.sh ${WORKSPACE}/target/scripts ${imageName} " +
      //                      "${lastSuccessfulBuildID} ${BUILD_NUMBER}", returnStatus: true)

   // }
}