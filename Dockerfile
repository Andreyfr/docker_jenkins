FROM jenkins/jenkins:lts

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root 
RUN apt-get update \ 
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
apt-transport-https \
ca-certificates \
curl \
gnupg2 \
software-properties-common \
vim \
wget \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

USER jenkins

