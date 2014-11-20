# Puppet manifest development environment

This repo contains scripts and configs for setting up a complete puppetserver-based configuration management dev environment.

* Vagrantfile - This starts up some VMs (Docker hosts)
* trantor - this directory contains the stuff that runs on this host
* anacreon - ditto
* bin - utility scripts - drop nsenter into your checkout of this directory, and docker-enter script makes it easy to get a shell in your container
