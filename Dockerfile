FROM docker.io/httpd as builder


# Copy and Work dir
RUN touch /tmp/will.txt
