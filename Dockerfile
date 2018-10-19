FROM jenkins/ssh-slave

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       make \
       python-software-properties \
       software-properties-common \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
 && add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" \
 && apt-get update \
 && apt-get install -y docker-ce \
 && apt-get autoremove -y \
 && apt-get autoclean all \
 && rm -rf /var/lib/apt/lists/*
