#!/bin/bash

yum install -y puppet git
(cd /tmp; git clone http://linux-install.cc.gatech.edu/pubrepos/docker_shared.git)
puppet apply /tmp/docker_shared/hosts.pp
yum install -y python-pip libyaml-devel python-devel
pip install -U fig
yum install -y device-mapper-libs docker-io && systemctl restart docker.service
curl -s http://linux-install.cc.gatech.edu/boxes/rhel7.docker.tgz | docker import - rhel7
for i in puppetdb puppetserver
do
  rm -rf /vagrant/trantor/$i/docker_shared
  (cd /tmp/; tar cf - docker_shared) | (cd /vagrant/trantor/$i; tar xf -)
done
