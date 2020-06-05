FROM python:3.6-slim-buster

ENV PATH ${PATH}:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /home

RUN apt-get clean && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y apt-utils

RUN apt-get install -y gnupg \
  zlibc \
  software-properties-common \
  locales-all

RUN pip install --upgrade setuptools wheel

COPY requirements/requirements.txt requirements/requirements_dev.txt ./

RUN pip install -r requirements.txt -r requirements_dev.txt
