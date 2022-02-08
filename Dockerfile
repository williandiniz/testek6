FROM loadimpact/k6

RUN apt get update
RUN apt get upgrade
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
RUN echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
RUN sudo apt-get update
RUN sudo apt-get install k6
