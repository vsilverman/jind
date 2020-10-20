ARG JENKINS_VERSION=2.249.2-lts
FROM jenkins/jenkins:$JENKINS_VERSION
LABEL MAINTAINER Vlad Silverman <vsilverman@gmail.com>
LABEL Description="This tutorial image shows how to setup Jenkins with Docker, Pipeline, and Groovy Hook Scripts"

# Docker install
USER root
RUN apt-get update && apt-get install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"
RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins

# auto install blue ocean plugins
RUN /usr/local/bin/install-plugins.sh blueocean:1.24.0
# RUN /usr/local/bin/install-plugins.sh docker-slaves github-branch-source:1.8

# use this for creating default admin user
# ENV JENKINS_USER admin
# ENV JENKINS_PASS admin

# COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# allows to skip Jenkins setup wizard
# ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
