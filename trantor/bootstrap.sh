#!/bin/bash

lvresize -L+5G /dev/vg1/var && resize2fs /dev/vg1/var
puppet apply puppetserver/docker_shared/hosts.pp
yum install -y python-pip libyaml-devel python-devel
pip install -U fig
cat /vagrant/rhel6.docker.tgz | docker import - rhel:6.5
yum install -y docker-io && service docker restart
