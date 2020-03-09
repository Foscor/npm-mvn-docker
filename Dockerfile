FROM mysql

MAINTAINER foscor/npm-mvn <william.tahar@gmail.com>

RUN echo "INSTALL NPM"
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -

RUN echo "INSTALL NODEJS"
RUN apt-get -y install nodejs

RUN echo "INSTALL angular/cli@7.3.9"
RUN npm install -g @angular/cli@7.3.9

RUN echo "INSTALL JAVA 8"
# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
