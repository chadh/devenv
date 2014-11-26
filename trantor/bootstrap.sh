#!/bin/bash

set -x
lvresize -L+5G /dev/vg1/var && resize2fs /dev/vg1/var
puppet apply /vagrant/docker_shared/hosts.pp
yum install -y python-pip libyaml-devel python-devel
pip install -U fig
yum install -y device-mapper-libs docker-io && service docker restart
curl -s http://linux-install.cc.gatech.edu/boxes/rhel6.docker.tgz | docker import - rhel:6.5

