#!/bin/bash

# Executar o script inteiro como root

sudo su - << EOF

  # Adicionar o repositório do Docker
  apt update
  apt install -y ca-certificates curl gnupg lsb-release
  
  mkdir -m 0755 -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  
  echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
              $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  chmod a+r /etc/apt/keyrings/docker.gpg
  apt update
  
  # Instalar o Docker
  apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  
  # Criar imagem de container Docker a partir do Dockerfile
  docker image build -t viacep .
  
  # Criar e executar container da aplicação VIACEP
  docker container run --name viacep-docker -dp 80:80 viacep

EOF
