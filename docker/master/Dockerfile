FROM jenkins/jenkins:latest

RUN /usr/local/bin/install-plugins.sh \
   git \
   workflow-aggregator \
   docker-workflow \
   docker-build-publish \
   blueocean \
   credentials-binding

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

VOLUME /var/jenkins_home
