FROM ubuntu:22.04

ENV TZ=Europe/Warsaw

#3.0

RUN apt update
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y
RUN apt-get install -y vim git curl unzip zip
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3.8
RUN apt-get install -y python-is-python3
RUN python3 --version

#3.5
RUN apt install -y openjdk-8-jdk
RUN apt-get update
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get -q -y install curl zip unzip
RUN curl -s https://get.sdkman.io | bash
RUN chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh"
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install kotlin

#4.0
RUN apt-get install -y gradle
RUN mkdir gradle_example
WORKDIR /gradle_example
RUN gradle init
RUN rm build.gradle
COPY build.gradle /gradle_example/
RUN gradle build