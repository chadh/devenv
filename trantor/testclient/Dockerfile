FROM        rhel7
MAINTAINER  Chad Huneycutt <chadh@cc.gatech.edu>

ADD         . /root/docker
WORKDIR     /root/docker
RUN         cp docker_shared/yumrepos/rhel7/* /etc/yum.repos.d/
RUN         yum install -y puppet
RUN         puppet apply docker_shared/hosts.pp \
            && puppet agent --test --server trantor-puppetserver.vm \
            && yum clean all
