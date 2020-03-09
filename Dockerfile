FROM maven:3-jdk-8

MAINTAINER foscor/npm-mvn <william.tahar@gmail.com>

RUN apt-get update
#RUN apt-get -y install curl gnupg
#RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
RUN npm install -g @angular/cli@7.3.9
