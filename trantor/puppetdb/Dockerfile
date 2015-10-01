FROM        rhel7
MAINTAINER  Chad Huneycutt <chadh@cc.gatech.edu>

ADD         . /root/docker
WORKDIR     /root/docker
## these will be needed for production
RUN         cp docker_shared/yumrepos/rhel7/* /etc/yum.repos.d/ && \
            rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
RUN         yum install -y puppet puppetdb tar nmap && \
            puppet module install puppetlabs/puppetdb && \
            yum clean all

