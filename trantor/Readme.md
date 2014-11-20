# Puppet Container Host

These are the files used in bringing up this host.  This directory is mounted under /vagrant.

There are inter-relationships when bringing up the puppetserver and puppetdb.  Basically, puppetdb needs to have the puppet certs in place before it is usable by the server, but the server hands out the certs.  So the process for getting these containers going is done in two phases.

These files 

* bootstrap.sh - script run by vagrant to set the host up
* fig-phase1.yml - This orchestrates the first phase of bringing up containers
* fig-phase2.yml - ditto for the second phase
* Similar to this directory, there are directories per container, with Dockerfiles, etc.
  * postgres
  * puppetdb
  * puppetdbstorage - storage-only container for puppetdb
  * puppetserver
  * puppetserverstorage - storage-only container for puppetserver
  * testclient
