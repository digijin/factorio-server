FROM ubuntu
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y xz-utils
# RUN cd tmp
# RUN wget https://www.factorio.com/get-download/stable/headless/linux64
COPY ./files /tmp
WORKDIR /opt
RUN tar -xJf /tmp/factorio_headless_x64_0.16.51.tar.xz

RUN useradd factorio
RUN chown -R factorio:factorio /opt/factorio

RUN mv /tmp/ninjatown.zip /opt/factorio/bin/x64/ninjatown.zip