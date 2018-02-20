FROM node:8.9.4 as buildStage

WORKDIR /app

COPY . /app

USER root:root

RUN chown node:users /app

RUN npm install -g bower

RUN npm install -g polymer-cli --unsafe-perm

USER node:users

RUN bower install

EXPOSE 8081

CMD polymer serve --hostname 0.0.0.0
