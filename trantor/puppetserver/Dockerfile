FROM        rhel:6.5
MAINTAINER  Chad Huneycutt <chadh@cc.gatech.edu>

ADD         . /root/docker
WORKDIR     /root/docker
RUN         cp docker_shared/yumrepos/* /etc/yum.repos.d/
RUN         yum install -y puppet tar && \
            puppet module install camptocamp/puppetserver && \
            puppet module install puppetlabs/puppetdb && \
            puppet apply docker_shared/hosts.pp && \
            puppet apply bootstrap-phase1.pp && \
            yum clean all
