# Dockerfile para MongoDB

Este projeto tem um Dockerfile básico para criar uma imagem Docker que roda o servidor MongoDB.

## Como usar
Veja como montar e rodar o contêiner MongoDB usando este Dockerfile.

## Pré-requisitos
- Ter o Docker instalado. Se ainda não tiver, pode baixar aqui: [Docker - Site Oficial](https://www.docker.com/products/docker-desktop/).

## Construindo a imagem Docker
- Clone este repositório (se for o caso) ou crie uma pasta com o Dockerfile dentro.
- Abra o terminal e vá até a pasta onde está o Dockerfile.
- Rode o comando abaixo para criar a imagem:

```
docker build -t meu-mongodb .
```

Explicando:
- `docker build`: comando para criar a imagem.
- `-t meu-mongodb`: dá um nome para a imagem (pode mudar para o que quiser).
- `.`: indica que o Dockerfile está na pasta atual.

## Rodando o contêiner MongoDB
Depois que a imagem estiver pronta, é só rodar o contêiner com:

```
docker run -d -p 27017:27017 --name mongodb-container meu-mongodb
```
