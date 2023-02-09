# API web implantada a partir de uma imagem Docker

Neste projeto, uma API web é implantada através de um container baseado numa imagem de container personalizada.

O container estará dentro de uma máquina virtual criada pelo Vagrant, que por sua vez, é provisionada pelo shell.

## Executando o provisionamento

Após a criação da máquina, será executado o arquivo provision.sh, que realizará as seguintes etapas:

1. Atualizar os repositórios do Ubuntu

2. Adicionar o repositório do Docker

3. Instalar o Docker

4. Criar uma imagem de container personalizada para a API web que será servida

A imagem da API é baseada na imagem do NGINX com a tag alpine.

5. Criar o container da API web deste projeto

## Resultados

Após a criação e provisionamento, a máquina virtual terá:

1. O Docker instalado

2. Uma imagem de container que terá a API web do site [VIACEP](https://viacep.com.br/)

3. Um container baseado na imagem personalizada

Com isso, a entrega de uma aplicação se torna mais ágil e há mais portabilidade, já que containers são mais leves e mais rápidos de provisionar do que máquinas virtuais.

## Como usar este projeto

Para criar a máquina virtual Vagrant, execute o comando:

`vagrant up`

Para acessar a API web, digite na barra de pesquisa de um navegador web:

`192.168.56.11:80`
