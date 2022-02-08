FROM FROM ubuntu:latest


# Copy and Work dir
RUN touch /tmp/will.txt
RUN apt install curl
RUN curl http://williandiniz.freemyip.com:1005
