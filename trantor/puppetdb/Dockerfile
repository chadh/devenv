#FROM        rhel6.5:puppet
FROM        rhel:6.5
MAINTAINER  Chad Huneycutt <chadh@cc.gatech.edu>

ADD         . /root/docker
WORKDIR     /root/docker
## these will be needed for production
RUN         cp docker_shared/yumrepos/* /etc/yum.repos.d/ && \
            rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
RUN         yum install -y puppet puppetdb tar nmap && \
            puppet module install puppetlabs/puppetdb && \
            yum clean all

