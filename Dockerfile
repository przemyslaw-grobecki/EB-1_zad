FROM ubuntu:22.04

ENV TZ=Europe/Warsaw

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