FROM centos:7.2.1511
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /root

# ports
EXPOSE 80 443 5222 68 69

ADD answers.txt /root/answers.txt

# add repositories
RUN yum install -y wget
RUN rpm -Uvh http://yum.spacewalkproject.org/2.4/RHEL/7/x86_64/spacewalk-repo-2.4-3.el7.noarch.rpm
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN cd /etc/yum.repos.d ; wget http://www.jpackage.org/jpackage50.repo

# install
RUN yum install -y spacewalk-setup-postgresql yum-versionlock
RUN yum versionlock cglib-2.1.3-4.jpp5
RUN yum update -y
RUN yum install -y spacewalk-postgresql

RUN spacewalk-setup --disconnected --answer-file=/root/answers.txt


# clean
RUN yum clean all ; rm -rf /tmp/*

ENTRYPOINT tail -f /var/log/*.log