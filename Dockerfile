FROM docker.io/ubuntu:latest as builder 
RUN apt-get update
RUN apt-get upgrade
RUN touch /tmp/willian.txt


