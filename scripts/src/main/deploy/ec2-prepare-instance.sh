#!/bin/bash

WORKSPACE="$1"

PEM_KEY_NAME=thisisanfield
SECURITY_GROUP_NAME=MySecurityGroup
EC2_PEM_KEY_PATH=/Users/abninder/aws_credentials/HelloWorld.pem
EC2_PUBLIC_DNS=""

aws=/usr/local/bin/aws

set +e
instanceId=$(${WORKSPACE}/target/scripts/deploy/checkRunningEc2Instances.sh ${aws})

if [[ $instanceId ]]; then
   echo instance id is: ${instanceId}
   EC2_PUBLIC_DNS=$(${aws} ec2 describe-instances --instance-ids ${instanceId} --query 'Reservations[].Instances[].PublicDnsName' --output text)
else

   ${WORKSPACE}/target/scripts/deploy/configureSecurityGroup.sh ${aws} ${SECURITY_GROUP_NAME}
   securityGroupId=$(${aws} ec2 describe-security-groups --group-names ${SECURITY_GROUP_NAME} --query 'SecurityGroups[*].[GroupId]' --output text)
   echo security group id is: ${securityGroupId}

   region=$(${aws} configure get region)
   echo region is: ${region}

   ${WORKSPACE}/target/scripts/deploy/authoriseSecurityGroup.sh ${aws} ${securityGroupId} ${region}

   ${WORKSPACE}/target/scripts/deploy/createPemKey.sh ${aws} ${EC2_PEM_KEY_PATH} ${PEM_KEY_NAME}

   echo preparing new instance and waiting for it to be ready ...
   EC2_PUBLIC_DNS=$(${WORKSPACE}/target/scripts/deploy/createNewEc2Instance.sh ${aws} ${PEM_KEY_NAME} ${SECURITY_GROUP_NAME} ${region})
fi

export WORKSPACE
export EC2_PUBLIC_DNS
export EC2_PEM_KEY_PATH

${WORKSPACE}/target/scripts/deploy/ec2-deployment.sh
exit $?

