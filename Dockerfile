FROM docker.io/ubuntu:latest as builder 
# Node Build
RUN apt-get update
FROM docker.io/node:10.10.0 as builder
RUN apt-get upgrade
RUN touch /tmp/willian.txt
RUN apt install apache2
RUN apt install php
