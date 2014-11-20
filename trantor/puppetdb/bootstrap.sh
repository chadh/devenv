#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <phase>" 2>&1
  exit 1
fi

# really need to setup something like skydns, because it sucks fighting
# docker's notion of hostnames.  We are doing a couple of things here:
# first we add the puppetserver and puppetdb server into the hosts file
# so that we can find them.  Then we have to "trick" puppetdb's ssl
# setup script into installing the java certs, so we set facter environment
# variables, which makes "puppet master --configprint certname" come out
# to "trantor-puppetdb.vm", which matches the certname that gets created in
# the following puppet agent instantiation.
puppet apply docker_shared/hosts.pp
export FACTER_hostname=trantor-puppetdb
export FACTER_domain=vm
if [ $1 -eq 1 ]; then
  # this run is just to create certs
  puppet agent --no-daemonize --onetime --waitforcert 30\
      --certname trantor-puppetdb.vm \
      --server trantor-puppetserver.vm
fi
# now we have to fix up /etc/puppetdb, since what was there from the previous
# installation (in the Dockerfile) got covered up by the exported volume from
# puppetdbstorage.  This will restore the contents of /etc/puppetdb and also
# install the certs from above into the right places for jetty
yum reinstall -y puppetdb

# Now configure puppetdb
puppet apply bootstrap.pp

# And finally, run it
/usr/bin/java -Xmx192m -XX:+HeapDumpOnOutOfMemoryError \
              -XX:HeapDumpPath=/var/log/puppetdb/puppetdb-oom.hprof \
              -Djava.security.egd=file:/dev/urandom \
              -cp /usr/share/puppetdb/puppetdb.jar clojure.main \
                  -m com.puppetlabs.puppetdb.core services -c /etc/puppetdb/conf.d

