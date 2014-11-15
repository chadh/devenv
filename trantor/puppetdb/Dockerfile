#FROM        rhel6.5:puppet
FROM        rhel:6.5
MAINTAINER  Chad Huneycutt <chadh@cc.gatech.edu>

ADD         . /root/docker
WORKDIR     /root/docker
## these will be needed for production
RUN         cp docker_shared/yumrepos/* /etc/yum.repos.d/ && \
            yum install -y puppet tar nmap && \
            puppet module install puppetlabs/puppetdb && \
            puppet apply docker_shared/hosts.pp && \
            puppet apply bootstrap.pp && \
            yum clean all

