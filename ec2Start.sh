#! /bin/sh
yum update -y
sudo amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
chkconfig docker on
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 686363414642.dkr.ecr.us-west-2.amazonaws.com
docker pull 686363414642.dkr.ecr.us-west-2.amazonaws.com/udp/listener:latest
docker run -e QUEUE_URL='https://sqs.us-west-2.amazonaws.com/686363414642/alpha-listener-sqs' -d --network=host 686363414642.dkr.ecr.us-west-2.amazonaws.com/udp/listener:latest