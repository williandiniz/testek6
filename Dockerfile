# Node Build
FROM docker.io/node:10.10.0 as builder

ARG BUILD_ENV

# Possible Targets: dev, hm, prod
ENV BUILD_ENV=${BUILD_ENV:-dev}

WORKDIR /usr/src/app
COPY package.json package-lock.json ./

COPY . .

RUN ls -la
RUN npm install -g ionic
RUN npm install

WORKDIR /usr/src/app

RUN echo $BUILD_ENV
RUN ls -la
RUN cp src/config/config.$BUILD_ENV.ts src/config/config.ts
RUN npm run build:web:$BUILD_ENV

# NGINX
FROM docker.io/bitnami/nginx:1.19.2 AS nginx

# Copy and Work dir
COPY --from=builder /usr/src/app/platforms/browser/www /app
