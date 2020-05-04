#!/bin/bash -xe
properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', numToKeepStr: '3']]])

node {
    def mvn_home
    def docker
    def imageName
    def lastSuccessfulBuildID

    environment {
        ec2_pem_key_path = "/Users/abninder/aws_credentials/HelloWorld.pem"
        status
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

        sh 'sleep 30'
        sh "cd ${WORKSPACE}/target/scripts/docker"
        sh "chmod 777 create-images.sh"
        sh "chmod 777 remove-previous-images.sh"

        sh "./remove-previous-images.sh"
        sh "./create-images.sh"
    }

    //login into docker hub and push the built image to docker hub with image tag
   // stage('Push image') {
    //    withCredentials([string(credentialsId: 'dockerLog', variable: 'DockerHubLogin')]) {
   //         sh "docker login -u abninder -p ${DockerHubLogin}"
      //  }
     //   sh "docker push ${imageName}:${BUILD_NUMBER}"
   // }

   // stage('prepare ec2 instance and deploy') {
    //    sh "chmod 777 ${WORKSPACE}/target/scripts/*.sh"
    //    sh(script: "${WORKSPACE}/target/scripts/ec2-prepare-instance.sh ${WORKSPACE}/target/scripts ${imageName} " +
      //                      "${lastSuccessfulBuildID} ${BUILD_NUMBER}", returnStatus: true)

   // }
}