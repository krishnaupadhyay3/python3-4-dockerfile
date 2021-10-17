FROM ubuntu:18.04
RUN apt-get update &&  apt-get install -y gcc apt-utils 
RUN apt-get update &&  apt-get install -y build-essential checkinstall wget zlib1g-dev zlibc
RUN apt-get install  -y libssl1.0
WORKDIR /python3.4
RUN cd /python3.4 && wget https://www.python.org/ftp/python/3.4.5/Python-3.4.5.tgz && \
    tar -xf Python-3.4.5.tgz  && cd Python-3.4.5 && \
    ./configure --prefix=/usr/local/  && make altinstall 

RUN python3.4 --version
WORKDIR /project
COPY ./requirements.txt /project

RUN pip3.4 install -r requirements.txt
