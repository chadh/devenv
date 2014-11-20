#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <phase>" 2>&1
  exit 1
fi

puppet apply docker_shared/hosts.pp
if [ $1 -eq 2 ]; then
  puppet apply bootstrap-phase2.pp
fi
/usr/bin/java -Xms512m -Xmx512m -XX:MaxPermSize=256m \
    -jar /usr/share/puppetserver/puppet-server-release.jar \
    --config /etc/puppetserver/conf.d \
    --bootstrap-config /etc/puppetserver/bootstrap.cfg
