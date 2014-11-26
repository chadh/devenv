#!/bin/bash

yum install -y puppet
puppet apply /vagrant/docker_shared/hosts.pp
yum install -y python-pip libyaml-devel python-devel
pip install -U fig
yum install -y device-mapper-libs docker-io && service docker restart
curl -s http://linux-install.cc.gatech.edu/boxes/rhel7.docker.tgz | docker import - rhel7

