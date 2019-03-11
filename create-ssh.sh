#!/bin/bash

yum install -y awscli

useradd mat

echo 'mat ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

mkdir -p /home/mat/.ssh
touch /home/mat/.ssh/authorized_keys

aws s3 sync s3://matorz.woa19.gdansk /tmp

cat /tmp/task1-ssh/id_rsa.pub >> /home/mat/.ssh/authorized_keys

