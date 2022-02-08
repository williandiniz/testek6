# FROM docker-registry.default.svc:5000/focus-${AMBIENTE}/php-72:latest
FROM ubuntu:20.04:latest
# USER root
USER 1

RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
RUN echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
RUN sudo apt-get update
RUN sudo apt-get install k6
