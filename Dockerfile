# define a imagem base
FROM debian:latest

# define o mantenedor da imagem
LABEL maintainer="Willian Diniz"

USER root
# Atualiza a imagem com os pacotes
RUN apt-get update && apt-get upgrade -y

# Instala o NGINX para testar
RUN apt-get install apache2 -y

# Expoe a porta 80
EXPOSE 80
