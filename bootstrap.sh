#!/bin/bash

echo "[TASK 1] Update"
yum update -y

echo "[TASK 2]"
yum install wget -y

echo "[TASK 3]"
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum upgrade

yum install java-11-openjdk -y
yum install jenkins -y
systemctl daemon-reload

systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins
