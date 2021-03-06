FROM jenkins/ssh-slave

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y curl \
 && curl -fsSL https://get.docker.com -o get-docker.sh \
 && sh get-docker.sh \
 && usermod jenkins -G docker --append \
 && rm get-docker.sh \
 && apt-get autoremove -y \
 && apt-get autoclean all \
 && rm -rf /var/lib/apt/lists/*
 
