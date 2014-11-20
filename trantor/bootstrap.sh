#!/bin/bash

set -x
lvresize -L+5G /dev/vg1/var && resize2fs /dev/vg1/var
puppet apply /vagrant/docker_shared/hosts.pp
yum install -y python-pip libyaml-devel python-devel
pip install -U fig
# the order of the next two lines is important.  The docker-io-1.2.0-3.el6
# version of docker has a bug that disallows tags on docker import.  So do the
# import, and *then* update docker.
curl -s http://linux-install.cc.gatech.edu/boxes/rhel6.docker.tgz | docker import - rhel:6.5
yum install -y docker-io && service docker restart

