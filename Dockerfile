FROM ubuntu:12.04
MAINTAINER Godefroid Chapelle

RUN apt-get update
RUN apt-get install -y wget

# fetch unified installer
RUN cd tmp && wget --no-check-certificate https://launchpad.net/plone/4.3/4.3.2/+download/Plone-4.3.2-UnifiedInstaller.tgz
RUN tar -xzf /tmp/Plone-4.3.2-UnifiedInstaller.tgz -C /tmp

# install plone dependencies
RUN apt-get install -y sudo bzip2 make python2.7-dev patch libxslt-dev
RUN /tmp/Plone-4.3.2-UnifiedInstaller/install.sh zeo

RUN apt-get install screen

#ENTRYPOINT ["/usr/local/Plone/zeocluster/bin/plonectl", "start"]
USER plone_daemon
EXPOSE 8080
#EXPOSE 8081
