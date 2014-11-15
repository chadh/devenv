#!/bin/bash

puppet apply docker_shared/hosts.pp
puppet agent --no-daemonize --onetime --certname trantor-puppetdb.vm --server trantor-puppetserver.vm
/usr/bin/java -Xmx192m -XX:+HeapDumpOnOutOfMemoryError \
              -XX:HeapDumpPath=/var/log/puppetdb/puppetdb-oom.hprof \
              -Djava.security.egd=file:/dev/urandom \
              -cp /usr/share/puppetdb/puppetdb.jar clojure.main \
                  -m com.puppetlabs.puppetdb.core services -c /etc/puppetdb/conf.d

