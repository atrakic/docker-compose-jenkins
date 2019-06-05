FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && apt-get install -y --no-install-recommends \
  docker-ce docker-ce-cli containerd.io \
  openjdk-8-jre \
  python3-minimal \
  python3-pip \
  python3-setuptools \
  git 

RUN pip3 install jenkins-webapi docker-compose
ADD slave.py /var/lib/jenkins/slave.py

RUN mkdir -p /home/jenkins /var/lib/jenkins
WORKDIR /home/jenkins

ENV JENKINS_URL "http://jenkins"
ENV JENKINS_SLAVE_ADDRESS ""
ENV JENKINS_USER "admin"
ENV JENKINS_PASS "admin"
ENV SLAVE_NAME ""
ENV SLAVE_SECRET ""
ENV SLAVE_EXECUTORS "1"
ENV SLAVE_LABELS "docker"
ENV SLAVE_WORING_DIR ""
ENV CLEAN_WORKING_DIR "true"

CMD [ "python3", "-u", "/var/lib/jenkins/slave.py" ]
